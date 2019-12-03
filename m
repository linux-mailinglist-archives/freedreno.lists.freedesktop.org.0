Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B681C110107
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2019 16:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BA56E83C;
	Tue,  3 Dec 2019 15:18:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 730 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 15:18:21 UTC
Received: from a27-55.smtp-out.us-west-2.amazonses.com
 (a27-55.smtp-out.us-west-2.amazonses.com [54.240.27.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C68E6E83C
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2019 15:18:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1C6B6C447A1
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 3 Dec 2019 15:06:10 +0000
Message-ID: <0101016ecc4c1bb4-926e0910-68e3-465d-8432-8d12e5893eb2-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575385543-11290-1-git-send-email-smasetty@codeaurora.org>
References: <1575385543-11290-1-git-send-email-smasetty@codeaurora.org>
X-SES-Outgoing: 2019.12.03-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575385570;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=HdBA3U6/eIISRmvCxk1G8NAyQEuTQY3aLr9PX/rQf1A=;
 b=e+gqpaxl9R+FiQIbdrmNwzF6y2mg66kfd5ZPok0BLiDfPiG06a/RmhqFTVifLufx
 XgBj+B5JvzgCGaamCgf+CVUntCvbTV4qBhET28tNU4rFyw1nPfB4Pf0YEZclLU/5lrW
 jCd7cODU9uT4sgp+5DU7Gp5jnLgSqISSCJbjZaw0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575385570;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=HdBA3U6/eIISRmvCxk1G8NAyQEuTQY3aLr9PX/rQf1A=;
 b=WJ7EwrGf/2MfUddR4FEfiAXS+2z7I1bIXAuFw+Wk8ux2PztbOPptXddTUHXlawYh
 7Y3clp98+O8tFTnzl/R9xxoteIAAGOBKFQFPYxGS0z+sE6WCx2KEo3RndYuEl9K1leV
 zkumiLZwJ0uYh67KIzWpAQjCzPoJuAeX+NOFJhsA=
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
cnRpZXMKdG8gdGhlIGdwdWxpc3QgZW50cmllcy4KCkNoYW5nZS1JZDogSWUxNGJhMDlmMzI1MTNi
YTZhNmM4ODJmZGEwZDk4ZWUxNzQyYjQ2ZDUKU2lnbmVkLW9mZi1ieTogU2hhcmF0IE1hc2V0dHkg
PHNtYXNldHR5QGNvZGVhdXJvcmEub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2FkcmVub19kZXZpY2UuYyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVu
b19kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2UuYwpp
bmRleCAwODg4ZTBkLi5lNzI4ZWE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hZHJlbm9fZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRy
ZW5vX2RldmljZS5jCkBAIC0xNTIsNiArMTUyLDE3IEBACiAJCS5pbml0ID0gYTV4eF9ncHVfaW5p
dCwKIAkJLnphcGZ3ID0gImE1NDBfemFwLm1kdCIsCiAJfSwgeworCQkucmV2ID0gQURSRU5PX1JF
Vig2LCAxLCA4LCBBTllfSUQpLAorCQkucmV2biA9IDYxOCwKKwkJLm5hbWUgPSAiQTYxOCIsCisJ
CS5mdyA9IHsKKwkJCVtBRFJFTk9fRldfU1FFXSA9ICJhNjMwX3NxZS5mdyIsCisJCQlbQURSRU5P
X0ZXX0dNVV0gPSAiYTYzMF9nbXUuYmluIiwKKwkJfSwKKwkJLmdtZW0gPSBTWl81MTJLLAorCQku
aW5hY3RpdmVfcGVyaW9kID0gRFJNX01TTV9JTkFDVElWRV9QRVJJT0QsCisJCS5pbml0ID0gYTZ4
eF9ncHVfaW5pdCwKKwl9LCB7CiAJCS5yZXYgPSBBRFJFTk9fUkVWKDYsIDMsIDAsIEFOWV9JRCks
CiAJCS5yZXZuID0gNjMwLAogCQkubmFtZSA9ICJBNjMwIiwKLS0gCjEuOS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBs
aXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
