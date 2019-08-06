Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19783B82
	for <lists+freedreno@lfdr.de>; Tue,  6 Aug 2019 23:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7909D6E577;
	Tue,  6 Aug 2019 21:36:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792C16E575;
 Tue,  6 Aug 2019 21:36:14 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73FC6217D9;
 Tue,  6 Aug 2019 21:36:13 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue,  6 Aug 2019 17:35:15 -0400
Message-Id: <20190806213522.19859-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213522.19859-1-sashal@kernel.org>
References: <20190806213522.19859-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565127374;
 bh=oQTegqnBdN+8NH3rtxET6dr016Tg2c77I8dr7iWPRXE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TKxJjBmK13HqeMzAoQ7X7gsGbxtGVWVqweH0NG437svRyXCXZPTH3n6n/QUyXAzUc
 gVgf1CghNgFtOT4a5FFTDBGAPWxT4Xfg4M76i2ksm1/vp7eNT2iPFmbmyWEE4A3BlH
 D0RvUg+DxIe5WNUT102Wa/jS/LgY68g2h6plDS5A=
Subject: [Freedreno] [PATCH AUTOSEL 4.19 27/32] drm: msm: Fix
 add_gpu_components
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
Cc: Sasha Levin <sashal@kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+CgpbIFVwc3RyZWFt
IGNvbW1pdCA5Y2E3YWQ2Yzc3MDZlZGVhZTMzMWMxNjMyZDBjNjM4OTc0MThlYmFkIF0KCmFkZF9n
cHVfY29tcG9uZW50cygpIGFkZHMgZm91bmQgR1BVIG5vZGVzIGZyb20gdGhlIERUIHRvIHRoZSBt
YXRjaCBsaXN0LApyZWdhcmRsZXNzIG9mIHRoZSBzdGF0dXMgb2YgdGhlIG5vZGVzLiAgVGhpcyBp
cyBhIHByb2JsZW0sIGJlY2F1c2UgaWYgdGhlCm5vZGVzIGFyZSBkaXNhYmxlZCwgdGhleSBzaG91
bGQgbm90IGJlIG9uIHRoZSBtYXRjaCBsaXN0IGJlY2F1c2UgdGhleSB3aWxsCm5vdCBiZSBtYXRj
aGVkLiAgVGhpcyBwcmV2ZW50cyBkaXNwbGF5IGZyb20gaW5pdGluZyBpZiBhIEdQVSBub2RlIGlz
CmRlZmluZWQsIGJ1dCBpdCdzIHN0YXR1cyBpcyBkaXNhYmxlZC4KCkZpeCB0aGlzIGJ5IGNoZWNr
aW5nIHRoZSBub2RlJ3Mgc3RhdHVzIGJlZm9yZSBhZGRpbmcgaXQgdG8gdGhlIG1hdGNoIGxpc3Qu
CgpGaXhlczogZGMzZWEyNjViODU2IChkcm0vbXNtOiBEcm9wIHRoZSBncHUgYmluZGluZykKUmV2
aWV3ZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTog
SmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFNl
YW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgpMaW5rOiBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA2MjYxODAwMTUuNDUyNDItMS1qZWZmcmV5
LmwuaHVnb0BnbWFpbC5jb20KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJu
ZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Ry
di5jCmluZGV4IGVkOWEzYTFlNTBlZmIuLmRiZmQyYzAwNmY3NDAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Ry
di5jCkBAIC0xMjg0LDcgKzEyODQsOCBAQCBzdGF0aWMgaW50IGFkZF9ncHVfY29tcG9uZW50cyhz
dHJ1Y3QgZGV2aWNlICpkZXYsCiAJaWYgKCFucCkKIAkJcmV0dXJuIDA7CiAKLQlkcm1fb2ZfY29t
cG9uZW50X21hdGNoX2FkZChkZXYsIG1hdGNocHRyLCBjb21wYXJlX29mLCBucCk7CisJaWYgKG9m
X2RldmljZV9pc19hdmFpbGFibGUobnApKQorCQlkcm1fb2ZfY29tcG9uZW50X21hdGNoX2FkZChk
ZXYsIG1hdGNocHRyLCBjb21wYXJlX29mLCBucCk7CiAKIAlvZl9ub2RlX3B1dChucCk7CiAKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
RnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
