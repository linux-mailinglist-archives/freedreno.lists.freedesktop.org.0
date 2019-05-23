Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C957284AA
	for <lists+freedreno@lfdr.de>; Thu, 23 May 2019 19:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A51E6E04A;
	Thu, 23 May 2019 17:17:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B525E6E046
 for <freedreno@lists.freedesktop.org>; Thu, 23 May 2019 17:17:02 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d10so4294085qko.4
 for <freedreno@lists.freedesktop.org>; Thu, 23 May 2019 10:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCPOgKXDLNcR6sFL6yT6feeZpVf/aYG9QLic+JdxubM=;
 b=NAbcZcfj/WzeImsjDjTwV/viur+c7gWKK3sISRJgGYycklwwArfes1QglhHdQWGGJs
 4wXGAb55xE3+SG7vCz5k1KtEH7Py3mY5pXW3MLnA5bWx2+ChtFLG5hf4OiR9juWHBnU8
 ejNTHe9+rotObKcADTrpOR8y+wVYvhLLLlzmAJPSmLEP6nuL0B768nqgXLAchN6BsITu
 abUWET8Ueo51l+T0mYI6f8eiJox6Nga0sYNw7R3gmjJzIy13QnvKwgUPAOqSOAhHSvGG
 rOI+/46/alyNdwEa6c9EUl+g94dVGTLuPEyEC0IFRYmshiEYNm+lMlElKbccf7PB7sME
 2IqA==
X-Gm-Message-State: APjAAAWqMTr+PsoL5blX0cnaD9WcOmx//AY7eHBKg8cvt51kS3zrF+2Y
 DX6FJ/mPPe4epBiPAx9ZIHC+PA==
X-Google-Smtp-Source: APXvYqzQK71cctzLw03xT3jdNw0SD9PtL3nBDxCQtUeUy9B9Z9lczPE6z44Z2LgpEKo1y0LKyhEpiQ==
X-Received: by 2002:a37:bd42:: with SMTP id n63mr32955087qkf.262.1558631821916; 
 Thu, 23 May 2019 10:17:01 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v25sm662660qtv.2.2019.05.23.10.17.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 10:17:01 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Date: Thu, 23 May 2019 13:16:41 -0400
Message-Id: <20190523171653.138678-2-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190523171653.138678-1-sean@poorly.run>
References: <20190523171653.138678-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCPOgKXDLNcR6sFL6yT6feeZpVf/aYG9QLic+JdxubM=;
 b=Z1BBTBNQGFwi1a6YCUrwlBkcg4d0qRPyeFFxcIpPo4kL342FYfzrTCrsCkzAKJSa8D
 kCvCZ4JJX1m+FaxkU6hE15FHkcAFiT2zElk/si/zSkchoOAdiwBxiOLRU0lML2gbFAFs
 Rg5cE0bbhO58zclxCiqYroZnyhw2gnIFuJ6HBh83XRG1VtMiuf65JIJdSxWZtfJvw94P
 Qq5yMfEY+W/7B2yQ1pB1dzV/MwFKp6QkShaRF+MFs/e2FgyMUxrZNt9lQ4K8MjDBNhVv
 +R1ZRdQv5bv4yai7m51LsnP6d0vgTkdl+odwD3o3xD/PGRz88NrIgiGzuFCZchP1VT9m
 rdAA==
Subject: [Freedreno] [PATCH v2 2/6] drm/msm/a6xx: Remove duplicate irq
 disable from remove
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

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgphNnh4X2dtdV9zdG9wKCkg
YWxyZWFkeSBjYWxscyB0aGlzIGZ1bmN0aW9uIHZpYSBzaHV0ZG93biBvciBmb3JjZV9zdG9wLApz
byBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gY2FsbCBpdCB0d2ljZS4gUHJldmlvdXNseSB0aGlzIHdv
dWxkIGhhdmUKa25vY2tlZCB0aGUgaXJxIHJlZmNvdW50IG91dCBvZiBzeW5jLCBidXQgbm93IHdp
dGggdGhlIGlycXNfZW5hYmxlZCBmbGFnCml0J3MganVzdCBob3VzZWtlZXBpbmcuCgpDaGFuZ2Vz
IGluIHYyOgotIE5vbmUKCkNjOiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2E2eHhfZ211LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCmluZGV4
IGFhODRlZGIyNWQ5MS4uNzQyYzhmZjlhNjFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hNnh4X2dtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2
eHhfZ211LmMKQEAgLTEyMzksNyArMTIzOSw2IEBAIHZvaWQgYTZ4eF9nbXVfcmVtb3ZlKHN0cnVj
dCBhNnh4X2dwdSAqYTZ4eF9ncHUpCiAJCWRldl9wbV9kb21haW5fZGV0YWNoKGdtdS0+Z3hwZCwg
ZmFsc2UpOwogCX0KIAotCWE2eHhfZ211X2lycV9kaXNhYmxlKGdtdSk7CiAJYTZ4eF9nbXVfbWVt
b3J5X2ZyZWUoZ211LCBnbXUtPmhmaSk7CiAKIAlpb21tdV9kZXRhY2hfZGV2aWNlKGdtdS0+ZG9t
YWluLCBnbXUtPmRldik7Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUg
LyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRy
ZW5v
