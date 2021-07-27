Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E394C3D7B9E
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 19:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300CC6EA15;
	Tue, 27 Jul 2021 17:07:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D1F6E4FB;
 Tue, 27 Jul 2021 17:07:35 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so5740966pji.5; 
 Tue, 27 Jul 2021 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=Y26suS2zv/ne/rmL5xGeK7mrZrZekL/BY237YS4TKXBIWvMYtXlM6hv4YcSIfH3JE7
 oKHVEtcK9zuQ3gaRCuTNwGXkowGwD9mTKdZsMZTKy1HJnv3JK6boDHpU17na6ISt69/h
 0Ay0fy1MDrD2ZPV1fDfPrUsYOR5kTQ6sRPsrY2pQ0qBBGRQU/msLnXPKh/4Nxi5kqDvq
 A02h+J8GOh/BKmExs7s4LpXf/mVPKdj2/XL7SGtwhL8JCAOvjiAOW3vXHZ6bGE9hpKEN
 5FoyrXzXAam5Qa4CgVK/5xzcL/xBil5pnhFoKZnsmAD9m2zCnMk/qKtEewop2A+Z6dcJ
 8BxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=m/cV4Lon2BJ7XYKlTxnhvzKuvyEZRFMQfhYwnB2OYUvlYVD9kU4jtdYPbr1eu+P9J+
 b8cTqyaspzz1J70qZ5tnLJP73ypmFCAYn5CoaYn/1pfssiQJtA0gXPQHRpTi+bIi/mUe
 5oS2om5wHtmN4zXD9pnW463oifmsgR/xEk4RnLJm9NZy4DIyL0g3iEQSCnMVYcXWo7us
 dEV6P7uwoIprhHPwaUpAkiP+qHeCW2Iuouw53NGIz5Vf6zljINJYImvbmFjvd/hCu5jY
 oPwV20uwrDNa9EB+Pi0sC8ypFtiSv/i1y8BwKW+4tfUbzyBj2jBTRXUW7UDvd3A9XzNh
 QdnQ==
X-Gm-Message-State: AOAM533zTnIYJOwrljFl2rZznwFNzv02Q5sDmH1skdDap1pEYwHmVCOO
 dYBjvKs2UfHoQVZKUB2LMTwKRClfIMFUEw==
X-Google-Smtp-Source: ABdhPJzzUAGDhGif/HDsMRU/cfM3CYj8pqTG9EUxuBzeUsh0jVyUcDWZ27u+jQDf/4zEVRvRe6Is3w==
X-Received: by 2002:a17:902:e8d8:b029:117:8e2c:1ed5 with SMTP id
 v24-20020a170902e8d8b02901178e2c1ed5mr19663772plg.39.1627405654576; 
 Tue, 27 Jul 2021 10:07:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id k5sm4445325pfu.142.2021.07.27.10.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:07:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 27 Jul 2021 10:11:18 -0700
Message-Id: <20210727171143.2549475-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 02/13] drm/msm: Small submitqueue creation
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
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
