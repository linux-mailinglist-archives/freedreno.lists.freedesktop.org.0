Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD2D3D84F7
	for <lists+freedreno@lfdr.de>; Wed, 28 Jul 2021 03:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C93B6EBAA;
	Wed, 28 Jul 2021 01:02:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8C06EB8E;
 Wed, 28 Jul 2021 01:02:28 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id m1so2660073pjv.2;
 Tue, 27 Jul 2021 18:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=t5Wepi5tj1bkE6GOdqqACip3pBBRrwi6TWI4YHUir3fDkwJG/Y90aB/7pCuXLVMaXG
 xcXfnHNtzQ94G3qtgrioXrXCQARLs+bDk4+/Mw0eXmzmCamoyR2wYp8vF1zRjM/W5r4C
 s3qD6Z2hOp6lkz2zxzhespg6qHGuVSoE8qKfi8FT6itW6WIAr1j0Bz3ot/4RfIUJg1Pr
 X90MwzsSlQ42X3B2yDIhmJFDC0KdBbugb3XRBnQT6LAvu6R6pFv/JELl/bvsqnQDPvzw
 zU9GjeAe43U4n7sKvbRzp+1JU/8eSEYiy9N4W+slm0kSfZeOISMcZF8LuWfUZ4GFgp9P
 TBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=Bz7fGfP9necuFomS1UD1RvzsOL60mAkutwRkNtnsiD7aCHY2CkOnVxiMuHiTZOzRzd
 Udhf7cxVHfBVqrwzmutrxGtllJis6N6FzpQW3/YzbhpohmZpjyUj0EqCikS42BeJPP/2
 LSQKya+qmGdfApNoFhjIDIM9ZLpavlITAcFOkE414klyddFrP/Cnk9B0uMHgD0Ig1es9
 UO+XWe0IpGrT7R1KHwuqXOK7W1Ll0qMVJEArrhURWNG4tLWoqTHNwJAKSoJJWQMc0F6q
 v9q0egx6AYB4LUIT0gzjXVWW4A/kihfaHXyEhq5oeM0vSdiF+pP5hAMpAZ+NsVXtUFIi
 0vXA==
X-Gm-Message-State: AOAM532wDHWdPQsDgpfil8VP6oO++nwtdkhMVwkXXKk0/a9++tKlNMkx
 xy6l5SllreK2V1Z67maPXus9IvlCvfBBAQ==
X-Google-Smtp-Source: ABdhPJytSJSEEESLfU0x+zsROI8dDqa9EpfmSYbyQiCyOZ1Lqgg+3Kh2J/NL9/Hikz/+IK8k8yGBXg==
X-Received: by 2002:a17:902:da8d:b029:12c:5241:c24e with SMTP id
 j13-20020a170902da8db029012c5241c24emr2766852plx.35.1627434147978; 
 Tue, 27 Jul 2021 18:02:27 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 p17sm4086712pjg.54.2021.07.27.18.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 27 Jul 2021 18:06:07 -0700
Message-Id: <20210728010632.2633470-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 02/13] drm/msm: Small submitqueue creation
 cleanup
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKSWYgd2UgZG9uJ3QgaGF2
ZSBhIGdwdSwgdGhlcmUgaXMgbm8gbmVlZCB0byBjcmVhdGUgYSBzdWJtaXRxdWV1ZSwgd2hpY2gK
bGV0cyB1cyBzaW1wbGlmeSB0aGUgZXJyb3IgaGFuZGxpbmcgYW5kIHN1Ym1pdHF1ZXVlIGNyZWF0
aW9uLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgpB
Y2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX3N1Ym1pdHF1ZXVlLmMgfCAyMiArKysrKysrKysrKy0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fc3VibWl0cXVldWUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX3N1Ym1pdHF1ZXVlLmMKaW5kZXggZTVlZWYxMWVkMDE0
Li45ZTlmZWM2MWQ2MjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX3N1Ym1p
dHF1ZXVlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fc3VibWl0cXVldWUuYwpAQCAt
NjYsNiArNjYsMTIgQEAgaW50IG1zbV9zdWJtaXRxdWV1ZV9jcmVhdGUoc3RydWN0IGRybV9kZXZp
Y2UgKmRybSwgc3RydWN0IG1zbV9maWxlX3ByaXZhdGUgKmN0eCwKIAlpZiAoIWN0eCkKIAkJcmV0
dXJuIC1FTk9ERVY7CiAKKwlpZiAoIXByaXYtPmdwdSkKKwkJcmV0dXJuIC1FTk9ERVY7CisKKwlp
ZiAocHJpbyA+PSBwcml2LT5ncHUtPm5yX3JpbmdzKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCXF1
ZXVlID0ga3phbGxvYyhzaXplb2YoKnF1ZXVlKSwgR0ZQX0tFUk5FTCk7CiAKIAlpZiAoIXF1ZXVl
KQpAQCAtNzMsMTUgKzc5LDcgQEAgaW50IG1zbV9zdWJtaXRxdWV1ZV9jcmVhdGUoc3RydWN0IGRy
bV9kZXZpY2UgKmRybSwgc3RydWN0IG1zbV9maWxlX3ByaXZhdGUgKmN0eCwKIAogCWtyZWZfaW5p
dCgmcXVldWUtPnJlZik7CiAJcXVldWUtPmZsYWdzID0gZmxhZ3M7Ci0KLQlpZiAocHJpdi0+Z3B1
KSB7Ci0JCWlmIChwcmlvID49IHByaXYtPmdwdS0+bnJfcmluZ3MpIHsKLQkJCWtmcmVlKHF1ZXVl
KTsKLQkJCXJldHVybiAtRUlOVkFMOwotCQl9Ci0KLQkJcXVldWUtPnByaW8gPSBwcmlvOwotCX0K
KwlxdWV1ZS0+cHJpbyA9IHByaW87CiAKIAl3cml0ZV9sb2NrKCZjdHgtPnF1ZXVlbG9jayk7CiAK
QEAgLTEwNywxMiArMTA1LDE0IEBAIGludCBtc21fc3VibWl0cXVldWVfaW5pdChzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtLCBzdHJ1Y3QgbXNtX2ZpbGVfcHJpdmF0ZSAqY3R4KQogCXN0cnVjdCBtc21f
ZHJtX3ByaXZhdGUgKnByaXYgPSBkcm0tPmRldl9wcml2YXRlOwogCWludCBkZWZhdWx0X3ByaW87
CiAKKwlpZiAoIXByaXYtPmdwdSkKKwkJcmV0dXJuIC1FTk9ERVY7CisKIAkvKgogCSAqIFNlbGVj
dCBwcmlvcml0eSAyIGFzIHRoZSAiZGVmYXVsdCBwcmlvcml0eSIgdW5sZXNzIG5yX3JpbmdzIGlz
IGxlc3MKIAkgKiB0aGFuIDIgYW5kIHRoZW4gcGljayB0aGUgbG93ZXN0IHByaW9yaXR5CiAJICov
Ci0JZGVmYXVsdF9wcmlvID0gcHJpdi0+Z3B1ID8KLQkJY2xhbXBfdCh1aW50MzJfdCwgMiwgMCwg
cHJpdi0+Z3B1LT5ucl9yaW5ncyAtIDEpIDogMDsKKwlkZWZhdWx0X3ByaW8gPSBjbGFtcF90KHVp
bnQzMl90LCAyLCAwLCBwcml2LT5ncHUtPm5yX3JpbmdzIC0gMSk7CiAKIAlJTklUX0xJU1RfSEVB
RCgmY3R4LT5zdWJtaXRxdWV1ZXMpOwogCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
