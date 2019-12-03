Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD03110152
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2019 16:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8B56E9D5;
	Tue,  3 Dec 2019 15:30:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 877 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 15:30:47 UTC
Received: from a27-10.smtp-out.us-west-2.amazonses.com
 (a27-10.smtp-out.us-west-2.amazonses.com [54.240.27.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D336E9D5
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2019 15:30:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52C55C447A5
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 3 Dec 2019 15:16:09 +0000
Message-ID: <0101016ecc5540c6-357d7186-1a2f-4125-9562-e8dde5d970a5-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
References: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
X-SES-Outgoing: 2019.12.03-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575386169;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=D0w2lJ7zOzLs96FDLoCJTUH+DP86bo5IYfSP2DOwF9k=;
 b=W7gBHl7m1Cs7HvVK+CwskURqRBVK9OeRw1dflxlzfVS2O5MkgR/XQHil1wHC7lti
 iPakHZE+2zY9zyVSlCJMoiRBw6RA8hW2GZevBhlXMxLrOwGU2T8U5mMYq+22ND3iTrp
 jNR5p82THrUxVyg+asFX0TzC6Hjv/LLXnE08ZJaw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575386169;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=D0w2lJ7zOzLs96FDLoCJTUH+DP86bo5IYfSP2DOwF9k=;
 b=RpaTfI2icNWv/5AuHu62QP2wvaUNdxcTaojsXVUgyS93m/agtqRIPyUVfS0XCgHQ
 sBe9JFqQm9YT0H3Dq2YawwpHkDGQPLblSr8UtaK2sbzJcXf4DSkvsRZpuEtblzg2vqA
 pFnz9it8AFhZkgBJkNXndAdk2SUS9z4lZFbQ3s/Q=
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: [Freedreno] [PATCH 1/5] drm: msm: Add 618 gpu to the adreno gpu list
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIEFkcmVubyA2MTggZW50cnkgYW5kIGl0cyBhc3NvY2lhdGVkIHByb3Bl
cnRpZXMKdG8gdGhlIGdwdWxpc3QgZW50cmllcy4KClNpZ25lZC1vZmYtYnk6IFNoYXJhdCBNYXNl
dHR5IDxzbWFzZXR0eUBjb2RlYXVyb3JhLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hZHJlbm9fZGV2aWNlLmMgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9h
ZHJlbm9fZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNl
LmMKaW5kZXggMDg4OGUwZC4uZTcyOGVhNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYWRyZW5vX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2FkcmVub19kZXZpY2UuYwpAQCAtMTUyLDYgKzE1MiwxNyBAQAogCQkuaW5pdCA9IGE1eHhfZ3B1
X2luaXQsCiAJCS56YXBmdyA9ICJhNTQwX3phcC5tZHQiLAogCX0sIHsKKwkJLnJldiA9IEFEUkVO
T19SRVYoNiwgMSwgOCwgQU5ZX0lEKSwKKwkJLnJldm4gPSA2MTgsCisJCS5uYW1lID0gIkE2MTgi
LAorCQkuZncgPSB7CisJCQlbQURSRU5PX0ZXX1NRRV0gPSAiYTYzMF9zcWUuZnciLAorCQkJW0FE
UkVOT19GV19HTVVdID0gImE2MzBfZ211LmJpbiIsCisJCX0sCisJCS5nbWVtID0gU1pfNTEySywK
KwkJLmluYWN0aXZlX3BlcmlvZCA9IERSTV9NU01fSU5BQ1RJVkVfUEVSSU9ELAorCQkuaW5pdCA9
IGE2eHhfZ3B1X2luaXQsCisJfSwgewogCQkucmV2ID0gQURSRU5PX1JFVig2LCAzLCAwLCBBTllf
SUQpLAogCQkucmV2biA9IDYzMCwKIAkJLm5hbWUgPSAiQTYzMCIsCi0tCjEuOS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGlu
ZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
