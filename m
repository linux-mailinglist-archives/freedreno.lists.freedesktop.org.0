Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D13261741
	for <lists+freedreno@lfdr.de>; Tue,  8 Sep 2020 19:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B756E200;
	Tue,  8 Sep 2020 17:29:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 1079 seconds by postgrey-1.36 at gabe;
 Tue, 08 Sep 2020 17:29:18 UTC
Received: from a27-56.smtp-out.us-west-2.amazonses.com
 (a27-56.smtp-out.us-west-2.amazonses.com [54.240.27.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745346E200
 for <freedreno@lists.freedesktop.org>; Tue,  8 Sep 2020 17:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599585079;
 h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type;
 bh=63I/CWXUQwQ4/xw3SHOSh+a3A2fsvq0vypwFNw9Go4s=;
 b=Zm3/OSewRza2+fPSWMWx2F31LMRW/bhZ+uWs/23DPNb6P+5FvUI5ybS15m1+kuOC
 n4+PCoEUONK99IYlskETjUA1SlU6GE5m2khWtLaYWRq2w+BZWDV269m71IpGXo8FIZu
 Q8850O8j7S3aASeLhnuzD1uQ33KsPZX1lMw7XqwI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599585079;
 h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:Feedback-ID;
 bh=63I/CWXUQwQ4/xw3SHOSh+a3A2fsvq0vypwFNw9Go4s=;
 b=D8mAho/SmqkbUNpAdt3ffSEQn1kG6UVELW62g6bF8tfGMgF0gh3CBzNtqAhii9Cn
 KYipjFL6aufvFRO1Cvl8xrwld8tYLb/pQZeckazNTgNtEB10zydJhJygkFn21XLmLEG
 I5yDaVGV9wwkHSqiTJYqN1oUeakagRQ+ORXqFxHc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01565C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 8 Sep 2020 17:11:19 +0000
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-firmware@kernel.org
Message-ID: <010101746eb34f46-7cc003e0-d25e-4471-a780-15d21789405e-000000@us-west-2.amazonses.com>
Mail-Followup-To: linux-firmware@kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2020.09.08-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Subject: [Freedreno] Adreno GPU microcode update
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The following changes since commit d5f9eea5a251d43412b07f5295d03e97b89ac4a5:

  wl18xx: update firmware file 8.9.0.0.83 (2020-09-01 08:07:59 -0400)

are available in the Git repository at:

  https://github.com/CosmicPenguin/linux-firmware.git for-master

for you to fetch changes up to f48fec44127f88ce83ea1bcaf5824de4146ca2f9:

  qcom: Add updated a5xx and a6xx microcode (2020-09-08 10:03:36 -0600)

----------------------------------------------------------------
Jordan Crouse (1):
      qcom: Add updated a5xx and a6xx microcode

 qcom/a530_pfp.fw | Bin 15876 -> 16144 bytes
 qcom/a630_sqe.fw | Bin 31316 -> 32056 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
