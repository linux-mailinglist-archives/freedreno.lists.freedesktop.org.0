Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E495AB33
	for <lists+freedreno@lfdr.de>; Sat, 29 Jun 2019 15:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156CF6E9A8;
	Sat, 29 Jun 2019 13:02:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232E06E9A9
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jun 2019 13:02:03 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v18so8608971ljh.6
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jun 2019 06:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lniFIm91gCkBVo8OT7Qc6rB8XEZiKvYZhCGqRwQxgRg=;
 b=GunFb8qVf3cOefjyUnx+lw6E63IuluLMaUpJZy/VaUo64QannRy2eZchJIdEzmkif5
 2AGhijLcmraCWTiNsld8fgSK/OF1316uyED2Y6QE/EX9tBsJfJJ7qpLup9NkgGU/mz77
 GxvJxxayYAueJfNmeh61rq/yHKL+DWic1tB1CEZay71FT43Sddv/PwQBT3iVIxxIpgQZ
 yg4WgsDVT136CEWT9zawRxCu61f88+bzfjsbUVVPgGSafYlu9ccG7qAlYLTvfDaFUllF
 srw2oocGeFbircb0pzPBesW7OwhzbKyrsLSOGh9BZObP0IyMHr3BAJYlzpM5aC4Ysr/z
 k6sA==
X-Gm-Message-State: APjAAAUDCM6XCSv35EGr5PhwoaIK24azT2siyFJT9FPcDjlcCyb+MS9o
 nOBWOQ9YZZLAF+QwuBxO3mQd4w==
X-Google-Smtp-Source: APXvYqwVGU+xg50XiekYht3IIxEqFHM099dgUifn3T0K/F2g1KQaP1T9fAtfYeTQ4lNEuy0h1An6cA==
X-Received: by 2002:a2e:8744:: with SMTP id q4mr8768966ljj.77.1561813321447;
 Sat, 29 Jun 2019 06:02:01 -0700 (PDT)
Received: from localhost.localdomain
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.02.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:02:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Date: Sat, 29 Jun 2019 14:59:30 +0200
Message-Id: <20190629125933.679-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lniFIm91gCkBVo8OT7Qc6rB8XEZiKvYZhCGqRwQxgRg=;
 b=R/OUJdhNfZGHaJoOsvmC50TZU4KNiySqOFuqTZkhUMlRuF2aiKO7gw52YdVXItSgcn
 yULpt7pmN8Q0FFQWwWXuiz9aPOeB3pvaPkb6xxb4hn467Tb4aGWSL9SCavDLu8IkKmmy
 qrTeh6vZQGGT0xcFf5zz72dp/fegF92Xn8K1lsaMp74Y52ZV+yXlor4P8xA3LvmbAVRg
 tyhC8dkj7Wq74VCB6f5GSAxCnIBTYFRJrgHvcNYjkbMf39LLwokl+2KRAWR7rROFUhJW
 510SqwEGSIvRO7vwvVY/+PCm/RmKugHh6Jbbn1ODQskyPdvHfCTEPIlI0+NbNPr/JqAa
 NqSA==
Subject: [Freedreno] [PATCH 4/7] gpio: of: Support some legacy Qualcomm HDMI
 bindings
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

SW5zdGVhZiBvZiB0aGUgTVNNIERSTSBjb2RlIGdvaW5nIGFyb3VuZCBhbmQgaW5zcGVjdGluZyB0
aGUKZGV2aWNlIHRyZWUgbm9kZXMgYnkgaXRzZWxmIHRvIGZpbmQgInFjb20sbWlzYyIgR1BJTyBw
aGFuZGxlcywKd2UgYWRkIGEgcXVpcmsgdG8gdGhlIGNvcmUgc28gdGhhdCBpZiAicWNvbSxtaXNj
LWdwaW9zIiBhbmQKInFjb20sbWlzYy1ncGlvIiBpc24ndCBmb3VuZCwgd2UgdHJ5IHRvIGZpbmQg
anVzdAoicWNvbSxtaXNjIiBhcyBhIGxhc3QgcmVzb3J0LiBQcm92aWRlIGFuIGV4cGxpY2l0IHdo
aXRlbGlzdApmb3IgdGhvc2UgR1BJT3MuCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwu
Y29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZn
ZXIua2VybmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQpSb2Iv
U2VhbjogaWYgdGhlIGFwcHJvYWNoIGlzIG92ZXJhbGwgT0sgSSB3aWxsIG1lcmdlIHRoaXMKb25l
IHBhdGNoIGFscmVhZHkgZm9yIHY1LjMgc28gdGhlIHJlc3QgY2FuIGJlIHF1ZXVlZCBmb3IKdjUu
NCBsYXRlci4KLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jIHwgNDMgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvbGliLW9mLmMgYi9kcml2ZXJzL2dw
aW8vZ3Bpb2xpYi1vZi5jCmluZGV4IGFlYzdiZDg2YWU3ZS4uYzkyN2VhZjZjODhmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jCisrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvbGli
LW9mLmMKQEAgLTI4Niw2ICsyODYsNDUgQEAgc3RhdGljIHN0cnVjdCBncGlvX2Rlc2MgKm9mX2Zp
bmRfcmVndWxhdG9yX2dwaW8oc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICoKIAlyZXR1
cm4gZGVzYzsKIH0KIAorLyoKKyAqIFNvbWUgbm9uLXN0YW5kYXJkIFF1YWxjb21tIEhETUkgR1BJ
T3MgbmVlZCB0byBiZSBzdXBwb3J0ZWQgYXMgdGhleSBleGlzdAorICogaW4gcmFuZG9tIG9sZCBk
ZXZpY2UgdHJlZXMgb3V0IHRoZXJlLgorICovCitzdGF0aWMgc3RydWN0IGdwaW9fZGVzYyAqb2Zf
ZmluZF9oZG1pX2dwaW8oc3RydWN0IGRldmljZSAqZGV2LAorCQkJCQkgICBjb25zdCBjaGFyICpj
b25faWQsCisJCQkJCSAgIGVudW0gb2ZfZ3Bpb19mbGFncyAqb2ZfZmxhZ3MpCit7CisJLyoKKwkg
KiBUaGVzZSBhcmUgdGhlIGNvbm5lY3Rpb24gSURzIHdlIGFjY2VwdCBhcyBsZWdhY3kgR1BJTyBw
aGFuZGxlcy4KKwkgKiBJZiB3ZSBnZXQgaGVyZSwgdGhlIHNhbWUgcHJlZml4IGVuZGluZyB3aXRo
ICItZ3BpbyIgYW5kICItZ3Bpb3MiCisJICogaGFzIGFscmVhZHkgYmVlbiB0cmllZCBzbyBub3cg
d2UgZmluYWxseSB0cnkgd2l0aCBubyBzdWZmaXguCisJICovCisJY29uc3QgY2hhciAqd2hpdGVs
aXN0W10gPSB7CisJCSJxY29tLGhkbWktdHgtZGRjLWNsayIsCisJCSJxY29tLGhkbWktdHgtZGRj
LWRhdGEiLAorCQkicWNvbSxoZG1pLXR4LWhwZCIsCisJCSJxY29tLGhkbWktdHgtbXV4LWVuIiwK
KwkJInFjb20saGRtaS10eC1tdXgtc2VsIiwKKwkJInFjb20saGRtaS10eC1tdXgtbHBtIiwKKwl9
OworCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7CisJc3RydWN0IGdwaW9f
ZGVzYyAqZGVzYzsKKwlpbnQgaTsKKworCWlmICghSVNfRU5BQkxFRChDT05GSUdfRFJNX01TTSkp
CisJCXJldHVybiBFUlJfUFRSKC1FTk9FTlQpOworCisJaWYgKCFjb25faWQpCisJCXJldHVybiBF
UlJfUFRSKC1FTk9FTlQpOworCisJaSA9IG1hdGNoX3N0cmluZyh3aGl0ZWxpc3QsIEFSUkFZX1NJ
WkUod2hpdGVsaXN0KSwgY29uX2lkKTsKKwlpZiAoaSA8IDApCisJCXJldHVybiBFUlJfUFRSKC1F
Tk9FTlQpOworCisJZGVzYyA9IG9mX2dldF9uYW1lZF9ncGlvZF9mbGFncyhucCwgY29uX2lkLCAw
LCBvZl9mbGFncyk7CisJcmV0dXJuIGRlc2M7Cit9CisKIHN0cnVjdCBncGlvX2Rlc2MgKm9mX2Zp
bmRfZ3BpbyhzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmNvbl9pZCwKIAkJCSAgICAg
ICB1bnNpZ25lZCBpbnQgaWR4LCB1bnNpZ25lZCBsb25nICpmbGFncykKIHsKQEAgLTMzMCw2ICsz
NjksMTAgQEAgc3RydWN0IGdwaW9fZGVzYyAqb2ZfZmluZF9ncGlvKHN0cnVjdCBkZXZpY2UgKmRl
diwgY29uc3QgY2hhciAqY29uX2lkLAogCWlmIChJU19FUlIoZGVzYykgJiYgUFRSX0VSUihkZXNj
KSAhPSAtRVBST0JFX0RFRkVSKQogCQlkZXNjID0gb2ZfZmluZF9yZWd1bGF0b3JfZ3BpbyhkZXYs
IGNvbl9pZCwgJm9mX2ZsYWdzKTsKIAorCS8qIFNwZWNpYWwgaGFuZGxpbmcgZm9yIEhETUkgR1BJ
T3MgaWYgdXNlZCAqLworCWlmIChJU19FUlIoZGVzYykgJiYgUFRSX0VSUihkZXNjKSAhPSAtRVBS
T0JFX0RFRkVSKQorCQlkZXNjID0gb2ZfZmluZF9oZG1pX2dwaW8oZGV2LCBjb25faWQsICZvZl9m
bGFncyk7CisKIAlpZiAoSVNfRVJSKGRlc2MpKQogCQlyZXR1cm4gZGVzYzsKIAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJl
bm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
