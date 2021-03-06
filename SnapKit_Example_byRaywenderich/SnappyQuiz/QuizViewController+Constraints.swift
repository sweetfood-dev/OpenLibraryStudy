/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import SnapKit

extension QuizViewController {
  func setupConstraints() {
    
    /* Delete code
     guard let navView = navigationController?.view else { return }
     
     viewProgress.translatesAutoresizingMaskIntoConstraints = false
     
     NSLayoutConstraint.activate([
     viewProgress.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
     viewProgress.heightAnchor.constraint(equalToConstant: 32),
     viewProgress.leadingAnchor.constraint(equalTo: view.leadingAnchor)
     ])
     */
    
    updateProgress(to: 0)
    
    /* Default NSLayoutConstraint - lblTimer
     lblTimer.translatesAutoresizingMaskIntoConstraints = false
     NSLayoutConstraint.activate([
     lblTimer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
     lblTimer.heightAnchor.constraint(equalToConstant: 45),
     lblTimer.topAnchor.constraint(equalTo: viewProgress.bottomAnchor, constant: 32),
     lblTimer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
     ])
     */
    // Snapkit Constraint - lblTimer
    lblTimer.snp.makeConstraints { make in
      make.width.equalToSuperview().multipliedBy(0.45)
      make.height.equalTo(45)
      make.top.equalTo(viewProgress.snp.bottom).offset(32)
      make.centerX.equalToSuperview()
    }
    
    /* Default NSLayoutConstraint - lblQuestion
     lblQuestion.translatesAutoresizingMaskIntoConstraints = false
     NSLayoutConstraint.activate([
     lblQuestion.topAnchor.constraint(equalTo: lblTimer.bottomAnchor, constant: 24),
     lblQuestion.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
     lblQuestion.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
     ])
     */
    // Snapkit Constraint - lblQuestion
    lblQuestion.snp.makeConstraints { make in
      make.top.equalTo(lblTimer.snp.bottom).offset(24)
      //      make.leading.equalToSuperview().offset(16)
      //      make.trailing.equalToSuperview().offset(-16)
      // ??? ????????? ????????? ??????
      make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
    }
    
    /* Default NSLayoutConstraint - lblMessage
     lblMessage.translatesAutoresizingMaskIntoConstraints = false
     NSLayoutConstraint.activate([
     lblMessage.topAnchor.constraint(equalTo: navView.topAnchor),
     lblMessage.bottomAnchor.constraint(equalTo: navView.bottomAnchor),
     lblMessage.leadingAnchor.constraint(equalTo: navView.leadingAnchor),
     lblMessage.trailingAnchor.constraint(equalTo: navView.trailingAnchor)
     ])
     */
    // Snapkit Constraint - lblMessage
    lblMessage.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    /* Default NSLayoutConstraint - svButtons
     svButtons.translatesAutoresizingMaskIntoConstraints = false
     NSLayoutConstraint.activate([
     svButtons.leadingAnchor.constraint(equalTo: lblQuestion.leadingAnchor),
     svButtons.trailingAnchor.constraint(equalTo: lblQuestion.trailingAnchor),
     svButtons.topAnchor.constraint(equalTo: lblQuestion.bottomAnchor, constant: 16),
     svButtons.heightAnchor.constraint(equalToConstant: 80)
     ])
     */
    // Snapkit Constriant - svButtons
    svButtons.snp.makeConstraints { make in
      make.leading.trailing.equalTo(lblQuestion)
      make.top.equalTo(lblQuestion.snp.bottom).offset(16)
      make.height.equalTo(80)
    }
  }
  
  func updateProgress(to progress: Double) {
    /* Default modify Constraint Code
     if let constraint = progressConstraint {
     constraint.isActive = false
     }
     
     progressConstraint = viewProgress.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: CGFloat(progress))
     progressConstraint.isActive = true
     */
    
    //    viewProgress.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    //    viewProgress.heightAnchor.constraint(equalToConstant: 32),
    //    viewProgress.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    viewProgress.snp.remakeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide)
      make.width.equalTo(view).multipliedBy(progress)
      make.height.equalTo(32)
      make.leading.equalToSuperview()
    }
  }
  
  
}


// MARK: - Orientation Transition Handling
extension QuizViewController {
  override func willTransition(to newCollection: UITraitCollection,
                               with coordinator: UIViewControllerTransitionCoordinator) {
    super.willTransition(to: newCollection, with: coordinator)
    
    let isPortrait = UIDevice.current.orientation.isPortrait
    
    lblTimer.snp.updateConstraints { make in
      make.height.equalTo(isPortrait ? 45 : 65)
    }
    
    lblTimer.font = .systemFont(ofSize: isPortrait ? 20 : 32, weight: .light)
  }
}
