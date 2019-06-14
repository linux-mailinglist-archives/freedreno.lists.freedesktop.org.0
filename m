Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EDC4680A
	for <lists+freedreno@lfdr.de>; Fri, 14 Jun 2019 21:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA5789A4E;
	Fri, 14 Jun 2019 19:10:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF3789415
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jun 2019 18:59:47 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id f21so2051381pgi.3
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jun 2019 11:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OK2URELdO7RxY+uNF7Lnr7thgZnPbEJ6QBz1RSeWqB4=;
 b=JHfb+mGUrb017ZK/Pm65NMLv0uXBZuwVrjsDXKp6U1ufJMVm4F3gz7oS6UGZrKhjgW
 biObxbYKRMICyaFCAul23+NmeXk1y7L+UEMiqmXRSDL+WDhRYIc8O3ghzj33DQMIsumr
 v9vmKSRMqd+x0nHZo046aZPF9jkHx4Es+wzdH3hRWoG8jvXF5SmZzy+thBrc4KrkpEIc
 oaJkiQxa3JCqwLZRW5TsQjkTU8gbZLCa/VFqEBReoI0TWY79WT3W4GLgp2WSdahkcmQC
 scIh+7+uxjXlsiebGoQgqXqL3wV9ZQT3YL7JusOmk5Lkb0ugfJ2ZDCxncdJD2g0DJq7e
 Ppxw==
X-Gm-Message-State: APjAAAUzTFDM7L2QvpOOOyJZWNXvh5jBtdv+wnD9jUUnQxxaCYHdDrPT
 XEOybSGiCGXrJt/PZOxK019UFKZlutpqRxB84LA26A==
X-Google-Smtp-Source: APXvYqxqVeicjZxel9x1al9yGWZ6O6UvyQw1hBmdDdXXapS54ZMeer7SqOBYNyZjU1XbQM6Qwan5fL3eu8LSxsqMcsQ=
X-Received: by 2002:a63:52:: with SMTP id 79mr36867363pga.381.1560538786212;
 Fri, 14 Jun 2019 11:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
 <875zp8wlbv.fsf@intel.com>
In-Reply-To: <875zp8wlbv.fsf@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 14 Jun 2019 11:59:34 -0700
Message-ID: <CAKwvOdmq2og84Ja6eNpiNdZd_ArxJ+=4a6_q_c2OgwX3Z+93NQ@mail.gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Fri, 14 Jun 2019 19:10:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OK2URELdO7RxY+uNF7Lnr7thgZnPbEJ6QBz1RSeWqB4=;
 b=v9fX7y6Et9gHVGLX5J5DVJ/e2cwXQKLP4ZiWPdKMtAzWG2+bTlmWHEfzNUxqF3oO6w
 Yf0m7UPWVy1QdoBtIl4sIcv7tXOFsigW8eZmUUtqn1PUz1yry+9GvwWTJFbRdcedECFL
 WnjU+wabR53xj69PzK/SDyBSgbDyhqgFZOJZEmLcnMqeiK0pjCPfzk9gSpL7PR/YXK0P
 iC9NxNHaOy9RGJHE2e0lBCDxc0fiq/RyRuXv62RiO8xrdayq99KbUQ+Ui12sbCphRIjf
 rRvb1+w4YbuRhU5WDSUtww1dA5WzZdqjRhg4Fd3M2OuKms1PlVEsaT+RFwSnlqG+UHPn
 A2Fg==
Subject: Re: [Freedreno] Cleanup of -Wunused-const-variable in
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Huckleberry <nhuck@google.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>, robdclark@gmail.com,
 Daniel Vetter <daniel@ffwll.ch>, jsanka@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMjo0MyBBTSBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
bGludXguaW50ZWwuY29tPiB3cm90ZToKPiBObyBvcGluaW9uIG9uIHRoZSBzYWlkIHZhcmlhYmxl
cyBhYm92ZSwgYnV0LCBGV0lXLCBwZXJzb25hbGx5IEkgdGhpbmsKPiBpdCdzIGZpbmUgdG8gYWRk
IHRoZSBjZmxhZ3MgdG8gc3VwcmVzcyB3YXJuaW5ncyBsb2NhbGx5IHdoZXJlIG5lZWRlZCBpbgo+
IG9yZGVyIHRvIGJlIGFibGUgdG8gYWNoaWV2ZSB0aGUgZ3JlYXRlciBnb2FsIG9mIHJlbW92aW5n
IHRoZSBjZmxhZ3MKPiBnbG9iYWxseS4KCkkgdGhpbmsgdGhlcmUncyBvbiB0aGUgb3JkZXIgb2Yg
fjEwIG9mIHRoZXNlOgpodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lz
c3Vlcz9xPWlzJTNBaXNzdWUraXMlM0FvcGVuK2xhYmVsJTNBLVd1bnVzZWQtY29uc3QtdmFyaWFi
bGUKTmF0aGFuJ3MgZ290IGEgcHJldHR5IGdvb2QgaGFuZGxlIG9uIGp1c3QgZml4aW5nIHRoZW0u
Cgo+IEluIGRyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlIHdlIGFjdHVhbGx5IGdvIGZvciBt
dWNoIHN0cmljdGVyCj4gd2FybmluZ3MgdGhhbiB0aGUga2VybmVsIGRlZmF1bHRzLCBhbmQgZGlz
YWJsZSBhIG1vcmUgbGltaXRlZCBhbmQKPiB0YWlsb3JlZCBzZXQgb2Ygd2FybmluZ3MuCgpJIGxp
a2UgdGhpcy4KCj4KPiBZb3UgY2FuIGRvIHRoaXMgYm90aCBvbiBhIHN1YmRpciBhbmQgZmlsZSBs
ZXZlbCB3aXRoIHN1YmRpci1jY2ZsYWdzLXkKPiBhbmQgQ0ZMQUdTX2ZpbGVuYW1lLm8sIHJlc3Bl
Y3RpdmVseS4KClRoYXQgc2FpZCwgSSBoYXZlIHVzZWQgdGhpcyB0cmljayBiZWZvcmUsIGJ1dCBJ
IGZlZWwgbGlrZSB0aGUgZmV3ZXIKcGVvcGxlIHRoYXQga25vdyBhYm91dCB0aGlzIHRyaWNrLCB0
aGUgbGVzcyBpdCBjYW4gYmUgW2FiXXVzZWQuCi0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVu
byBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
