Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D12CE95
	for <lists+freedreno@lfdr.de>; Tue, 28 May 2019 20:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDC16E042;
	Tue, 28 May 2019 18:27:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A7B6E042
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2019 18:26:59 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id n76so8305021ywd.1
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2019 11:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7yQwjOt7RMrp1ZBk1OxLjkgfAWLV7jytWzkNhOC/gSo=;
 b=o1Di4c4Or+ee7lHVlA2lzNkBvRcqirU/MoMrFDcoDt9ykeFhrs2KfqnzEmjTYukTJI
 UiOZiNREl5jUpaP181NTiGyBlS/Ze+/qmSShQJ0Ip2NWXYX3lbz51oXx3F8WOJb9AicZ
 Exgyl+ty+q3kJ802iuz9nhpsfqq5YfCT5o/58TZ+sJzYg/hc8atyZ3dgrjujHUVF7zTS
 Her4SvOdLytISt7zb0jlZLSpUtIt5K7iiK46kBRXDIcfpqDsmdZP8R2WgFTgz3Hi7XSf
 P6kWWKv1dE13BmKXhavuj6batFq7Qraooojnpw9Zc9LcnZrrLCtQvU3hnh8KJDUXc4Pk
 qbOw==
X-Gm-Message-State: APjAAAX/jg77r4Fw7Shjvp404Kr5dzU8xHhD3kk0FBX8NU+DFB1YVqZj
 +JKBgv8rpr6xvsKoZlDbxPHLmA==
X-Google-Smtp-Source: APXvYqwkVpRRs8Qgo+zPcrAGSyRwpY4dtidnfGumjxN0qS9GnudEVQSJTf+UCPIbxqw9EoC8hLy70w==
X-Received: by 2002:a81:4c46:: with SMTP id z67mr28249618ywa.267.1559068018920; 
 Tue, 28 May 2019 11:26:58 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k205sm3703061ywc.69.2019.05.28.11.26.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 11:26:58 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Date: Tue, 28 May 2019 14:26:45 -0400
Message-Id: <20190528182657.246714-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190528154125.GA23227@jcrouse1-lnx.qualcomm.com>
References: <20190528154125.GA23227@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7yQwjOt7RMrp1ZBk1OxLjkgfAWLV7jytWzkNhOC/gSo=;
 b=MgIkNC6iYi6IaMypw2y0pB+JJFA7DuzlPTLK6XWFNg0cyQ3XitlHichVLmjm2VvW26
 1X9tsHoz+96lwpx8YhVv+xUuNPCGaGq4mFgdgwwAW4/G9Vd0Ma+RNmZZOMUuidPwVFpp
 eDRKoy+rhPuEwr/TpulzUEmq1AWZvSt8leutcH/Tfhet984feZ6CybJf1TTjqQE6lcCN
 WQqnpd8zXcwgKdbAU43qLdVvl3+aBv2GlPTS4q8bbFk44kOx2NgHQd8kDzh8TNHn59cx
 1mKGNDlE64VrYkYmnTFeOZxpzky2Og9XSMRvp8rAFbq64N6jMmI3Y2OkX7B6PfkmdDeT
 TKQg==
Subject: [Freedreno] [PATCH] drm/msm/dpu: Remove bogus comment
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
Cc: Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGlzIGNvbW1lbnQgZG9l
c24ndCBtYWtlIGFueSBzZW5zZSwgcmVtb3ZlIGl0LgoKU3VnZ2VzdGVkLWJ5OiBKb3JkYW4gQ3Jv
dXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNl
YW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfa21zLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCmluZGV4IDg4NWJmODhhZmEzZS4uNTBkMGU5YmE1
ZDJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCkBAIC0yNDMsNyAr
MjQzLDYgQEAgc3RhdGljIGludCBfZHB1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHB1X2ttcyAqZHB1
X2ttcykKIAlpZiAoSVNfRVJSX09SX05VTEwoZW50cnkpKQogCQlyZXR1cm4gLUVOT0RFVjsKIAot
CS8qIGFsbG93IHJvb3QgdG8gYmUgTlVMTCAqLwogCWRlYnVnZnNfY3JlYXRlX3gzMihEUFVfREVC
VUdGU19IV01BU0tOQU1FLCAwNjAwLCBlbnRyeSwgcCk7CiAKIAlkcHVfZGVidWdmc19kYW5nZXJf
aW5pdChkcHVfa21zLCBlbnRyeSk7Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZnJlZWRyZW5v
