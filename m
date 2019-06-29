Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A605AB30
	for <lists+freedreno@lfdr.de>; Sat, 29 Jun 2019 15:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838186E9A7;
	Sat, 29 Jun 2019 13:02:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D58B6E9A3
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jun 2019 13:02:00 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x144so5756051lfa.9
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jun 2019 06:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ji8jAojLPl8vD+gcsy1dZ2LAcjvPmFSVJ5glNsjtSak=;
 b=UlUUalkkYQ65/+Urar0aLHoqfBDaa4I0DAogSIR/UsxIg0HQooLUpxV0Nel8KIfWkL
 UqpwAlnLuXF0qYggV9CLfynWRSMTTwnRpYoflOVbiK38gaAQxjeHX//+lYzK30GXafr1
 wgqeq2/lYzAj31P9Bx9lPUyW1ZtSIB6ddHSVh7zwyt1rU7DipLn+bFmT3U/CwOdZshPS
 PbQkcW/frgV2pfHMXkHTo3sxVFQNThbJYssB1Or3yV1JjiIjwDo7YFDXTCp3JTJ9pH3M
 MVELaS0jKUkYTUXwQ3+8N9XMxCQF0JjpN2rxEBsEbvRF981T//QhYZzUS1pF/zlrmHJa
 cZ0Q==
X-Gm-Message-State: APjAAAVbvWNpIYDOG0KpQVQ0eVB6ERq6O6EVmD/FQDr4e3bdwgW3oj5Z
 ryz2iDY1vS9KRV2TMQqZh57Jkg==
X-Google-Smtp-Source: APXvYqw4JVg2KbWLoxvVW9U6jPqYrcYh2H4AXq4ph9NDkiYzD2Bg7mSbg0zvS+exFIzcUH3D8CLeKg==
X-Received: by 2002:a19:f601:: with SMTP id x1mr7523920lfe.182.1561813318996; 
 Sat, 29 Jun 2019 06:01:58 -0700 (PDT)
Received: from localhost.localdomain
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.01.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:01:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Date: Sat, 29 Jun 2019 14:59:29 +0200
Message-Id: <20190629125933.679-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ji8jAojLPl8vD+gcsy1dZ2LAcjvPmFSVJ5glNsjtSak=;
 b=nAjmGaNaoXOfVZnFCs0LUWx0cgkIpWqrZKexDYARBy6576kyG3UYP+U3tLv6Z7mbun
 3mza7Rr4HNinHrz/Z+ZS8QeQeD2ig1Wuy5eIgVPImRlRcCxR6UE3d6lvjrMrektszXS+
 0CG3ahmSPlVFxu3mFx0uVQqdq4jNPLcFg8BC+yVu43Um7D3UMfNOpakEUcEVn6MuC8Ry
 X4Gx9ihORnId7aLMGMVG+MYoXUZ7qMgU1CSiYsMEXSOfdUiBe/5UWIg8MwtVDMvToc9k
 2kG/2Li5Bv+dVCPKpJYsQ5s5V65k/L9JNU0oyZMgdR84ds/6gyw5txkGZP6EpXJbSn72
 8DlA==
Subject: [Freedreno] [PATCH 3/7] drm/msm/dpu: Drop unused GPIO code
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
Cc: linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhlIERQVSBoYXMgc29tZSBraW5kIG9mIGlkZWEgdGhhdCBpdCB3YW50cyB0byBiZSBhYmxlIHRv
CmJyaW5nIHVwIHBvd2VyIHVzaW5nIEdQSU8gbGluZXMuIFRoZSBzdHJ1Y3QgZHNzX2dwaW8gaXMg
aG93ZXZlcgpjb21wbGV0ZWx5IHVudXNlZCBhbmQgc2hvdWxkIHRoaXMgYmUgZG9uZSwgaXQgc2hv
dWxkIGJlIGRvbmUKdXNpbmcgdGhlIEdQSU8gZGVzY3JpcHRvciBmcmFtZXdvcmsgcmF0aGVyIHRo
YW4gdGhpcyBBUEkKd2hpY2ggcmVsaWVzIG9uIHRoZSBnbG9iYWwgR1BJTyBudW1iZXJzcGFjZS4g
RGVsZXRlIHRoaXMKY29kZSBiZWZvcmUgYW55b25lIGh1cnQgdGhlbXNlbHZlcy4KClRoZSBpbmNs
dXNpb24gb2YgPGxpbnV4L2dwaW8uaD4gd2FzIGFidXNlZCB0byBnZXQgc29tZSBPRgphbmQgSVJR
IGhlYWRlcnMgaW1wbGljaXRseSBpbmNsdWRlZCBpbnRvIHRoZSBEUFUgdXRpbGl0aWVzLAptYWtl
IHRoZXNlIGluY2x1ZGVzIGV4cGxpY2l0IGFuZCBwdXNoIHRoZW0gZG93biBpbnRvIHRoZSBhY3R1
YWwKaW1wbGVtZW50YXRpb24uCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpD
YzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2Vy
bmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuaCB8IDkgLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jICAgIHwgNCArKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2lvX3V0aWwuYwppbmRleCA3ODgzM2MyYzI3ZjguLjc4ZjA0MTQ3ODM5ZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jCkBAIC0xNSw2
ICsxNSw3IEBACiAjaW5jbHVkZSA8bGludXgvY2xrL2Nsay1jb25mLmg+CiAjaW5jbHVkZSA8bGlu
dXgvZXJyLmg+CiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KKyNpbmNsdWRlIDxsaW51eC9vZi5o
PgogCiAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2lvX3V0aWwuaAppbmRleCBiYzA3MzgxZDc0MjkuLmEwNDk4YzdiZDY3NyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5oCkBAIC0xMyw3
ICsxMyw2IEBACiAjaWZuZGVmIF9fRFBVX0lPX1VUSUxfSF9fCiAjZGVmaW5lIF9fRFBVX0lPX1VU
SUxfSF9fCiAKLSNpbmNsdWRlIDxsaW51eC9ncGlvLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZv
cm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KIApAQCAtMjIsMTIgKzIxLDYg
QEAKICNkZWZpbmUgREVWX1dBUk4oZm10LCBhcmdzLi4uKSAgcHJfd2FybihmbXQsICMjYXJncykK
ICNkZWZpbmUgREVWX0VSUihmbXQsIGFyZ3MuLi4pICAgcHJfZXJyKGZtdCwgIyNhcmdzKQogCi1z
dHJ1Y3QgZHNzX2dwaW8gewotCXVuc2lnbmVkIGludCBncGlvOwotCXVuc2lnbmVkIGludCB2YWx1
ZTsKLQljaGFyIGdwaW9fbmFtZVszMl07Ci19OwotCiBlbnVtIGRzc19jbGtfdHlwZSB7CiAJRFNT
X0NMS19BSEIsIC8qIG5vIHNldCByYXRlLiByYXRlIGNvbnRyb2xsZWQgdGhyb3VnaCBycG0gKi8K
IAlEU1NfQ0xLX1BDTEssCkBAIC00Miw4ICszNSw2IEBAIHN0cnVjdCBkc3NfY2xrIHsKIH07CiAK
IHN0cnVjdCBkc3NfbW9kdWxlX3Bvd2VyIHsKLQl1bnNpZ25lZCBpbnQgbnVtX2dwaW87Ci0Jc3Ry
dWN0IGRzc19ncGlvICpncGlvX2NvbmZpZzsKIAl1bnNpZ25lZCBpbnQgbnVtX2NsazsKIAlzdHJ1
Y3QgZHNzX2NsayAqY2xrX2NvbmZpZzsKIH07CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X21kc3MuYwppbmRleCA3MzE2YjRhYjFiODUuLjliYWFiYWRjNjJiYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X21kc3MuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jCkBAIC0zLDYgKzMsMTAgQEAKICAqIENvcHly
aWdodCAoYykgMjAxOCwgVGhlIExpbnV4IEZvdW5kYXRpb24KICAqLwogCisjaW5jbHVkZSA8bGlu
dXgvaXJxLmg+CisjaW5jbHVkZSA8bGludXgvaXJxY2hpcC5oPgorI2luY2x1ZGUgPGxpbnV4L2ly
cWRlc2MuaD4KKyNpbmNsdWRlIDxsaW51eC9pcnFjaGlwL2NoYWluZWRfaXJxLmg+CiAjaW5jbHVk
ZSAiZHB1X2ttcy5oIgogCiAjZGVmaW5lIHRvX2RwdV9tZHNzKHgpIGNvbnRhaW5lcl9vZih4LCBz
dHJ1Y3QgZHB1X21kc3MsIGJhc2UpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5v
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
