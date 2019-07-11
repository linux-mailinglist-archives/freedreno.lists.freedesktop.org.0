Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB63565FB1
	for <lists+freedreno@lfdr.de>; Thu, 11 Jul 2019 20:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C836E273;
	Thu, 11 Jul 2019 18:46:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E714D6E279;
 Thu, 11 Jul 2019 18:46:52 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id CA34860E7A; Thu, 11 Jul 2019 18:46:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jeykumar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jsanka@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CA4560E41;
 Thu, 11 Jul 2019 18:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2CA4560E41
From: Jeykumar Sankaran <jsanka@codeaurora.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org, robdclark@gmail.com
Date: Thu, 11 Jul 2019 11:46:45 -0700
Message-Id: <1562870805-32314-2-git-send-email-jsanka@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562870812;
 bh=xHTm+r3iev8HeqpPDWURSLUS+X6fMCYc5WJrMfReLEg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H02usFybvTCz+6qvCK9z2ba/Jf4DpBwwWfFjWNW6XXe2IpIJc4CTv+JpeUcQxMAck
 ZM6a4/3Q0QhEZWEH86VS98/9MQ3jMU2DIr+H0EWR+83dm20pzMllDo0SF9zHYNLXty
 EQ6AsQOLmyZHUbtfY814QxkzTHeroxikQRK4iFmA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562870812;
 bh=xHTm+r3iev8HeqpPDWURSLUS+X6fMCYc5WJrMfReLEg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H02usFybvTCz+6qvCK9z2ba/Jf4DpBwwWfFjWNW6XXe2IpIJc4CTv+JpeUcQxMAck
 ZM6a4/3Q0QhEZWEH86VS98/9MQ3jMU2DIr+H0EWR+83dm20pzMllDo0SF9zHYNLXty
 EQ6AsQOLmyZHUbtfY814QxkzTHeroxikQRK4iFmA=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jsanka@codeaurora.org
Subject: [Freedreno] [RFC PATCH] drm: add mode flags in uapi for seamless
 mode switch
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
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>, pdhaval@codeaurora.org,
 nganji@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QWRkIGRybSBtb2RlIGZsYWcgdmFsdWVzIHRvIGV4cG9zZSBtb2RlIGNhcGFiaWxpdGllcyB0bwpw
ZXJmb3JtIGR5bmFtaWMgc2VhbWxlc3MgbW9kZSBzd2l0Y2guIFRoaXMgY2hhbmdlIGFsc28KZXhw
b3NlcyB0aGUgYmFja2luZyBwYW5lbCB0eXBlIGFzc29jaWF0ZWQgd2l0aCBhIG1vZGUKZm9yIHBh
bmVscyB3aGljaCBjYW4gZHluYW1pY2FsbHkgc3dpdGNoIGJldHdlZW4gdmlkZW8KYW5kIGNvbW1h
bmQgZGlzcGxheSBtb2Rlcy4KClNpZ25lZC1vZmYtYnk6IEpleWt1bWFyIFNhbmthcmFuIDxqc2Fu
a2FAY29kZWF1cm9yYS5vcmc+Ci0tLQogaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIHwgNSAr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaAppbmRl
eCA1YWIzMzFlLi5iNzZmMWJmIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2Rl
LmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCkBAIC0xMjQsNiArMTI0LDExIEBA
CiAjZGVmaW5lICBEUk1fTU9ERV9GTEFHX1BJQ19BUl8yNTZfMTM1IFwKIAkJCShEUk1fTU9ERV9Q
SUNUVVJFX0FTUEVDVF8yNTZfMTM1PDwxOSkKIAorI2RlZmluZSBEUk1fTU9ERV9GTEFHX1NFQU1M
RVNTX1NXSVRDSCAoMTw8MjMpCisKKyNkZWZpbmUgRFJNX01PREVfRkxBR19WSURFT19NT0RFICAg
KDE8PDI0KQorI2RlZmluZSBEUk1fTU9ERV9GTEFHX0NPTU1BTkRfTU9ERSAoMTw8MjUpCisKICNk
ZWZpbmUgIERSTV9NT0RFX0ZMQUdfQUxMCShEUk1fTU9ERV9GTEFHX1BIU1lOQyB8CQlcCiAJCQkJ
IERSTV9NT0RFX0ZMQUdfTkhTWU5DIHwJCVwKIAkJCQkgRFJNX01PREVfRkxBR19QVlNZTkMgfAkJ
XAotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9m
IHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUg
UHJvamVjdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
RnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
