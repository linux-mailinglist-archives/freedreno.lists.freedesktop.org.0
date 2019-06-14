Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E770F46809
	for <lists+freedreno@lfdr.de>; Fri, 14 Jun 2019 21:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6900D8999A;
	Fri, 14 Jun 2019 19:10:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDD3899F2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jun 2019 18:56:04 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id l19so2028791pgh.9
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jun 2019 11:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vi9HOqhVGYAs7GQ1RGU6Au5JJxjAyVHZ1t3+UITLDWM=;
 b=Qsqw4kUHEarNQHhGMjbYPJO90WkRXRe0Dq7O3qWbo7D8R3a99PLpWnZs3/7eXOU29R
 MYQky2SRO7StMwggdSuFou6BFfy5WWGGMTVoWPg+5QJNDgRjmNVepN+fpZkWBY/K16DY
 ip+kU1hLJW8haVnUN6iK+/eGNko+hL+0bFZ42Q3RJCuIldOW06TIFbSVdT6HiCBMNmuE
 2ern86sJIHCqgnpxQN2VdXK5LH63OvH20Sdf3APlLDwd+d7jrsVQNWhrC1XU/lwIIBCt
 aXYHf6Meteu5IO4lveyXEf2Z/TZcdSZJe/Wc3OAKvLm06qCBEsLAaSubOLe42CVjvZeK
 kMuw==
X-Gm-Message-State: APjAAAUVpEY2b9zr8laDWoXJjRsRy+HusUc1bd1zcSIbcImEp1b+YSy/
 +AEVHXqB5RDRBL2gm2yo1MxG7Ogpdr5qd7OK+UzjUQ==
X-Google-Smtp-Source: APXvYqwU93ybihiYA9qI1ZfNbjRei7zFHARUnTO+Rc8QUH+8TNozlwasI5X3wqGb0bv42HyvcYj6+f7tryRZXmfjnTI=
X-Received: by 2002:a63:306:: with SMTP id 6mr24242533pgd.263.1560538563050;
 Fri, 14 Jun 2019 11:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
 <CAMavQKLFSqb7nW1UsxutbGMQ9AM_ZXTVhrdzPsN3rJXLTnyGkQ@mail.gmail.com>
In-Reply-To: <CAMavQKLFSqb7nW1UsxutbGMQ9AM_ZXTVhrdzPsN3rJXLTnyGkQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 14 Jun 2019 11:55:52 -0700
Message-ID: <CAKwvOdkcYfeKSwvGHRmvj4xUT1vJ=vU5ubxrqrkPC1STNuOz5w@mail.gmail.com>
To: Sean Paul <sean@poorly.run>
X-Mailman-Approved-At: Fri, 14 Jun 2019 19:10:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Vi9HOqhVGYAs7GQ1RGU6Au5JJxjAyVHZ1t3+UITLDWM=;
 b=KcCX5mU37AGn3G3Wc0liG/jc8GtXaM2IsJzf9mOsShHLTiWFHUKFqTCT42vg2eB+Q7
 8PSsg1gghWwbdHmqGZMVPntXTFyG6yoY0N90EQ36+PBbZeMfTxZcpRTKLZfl6//wrAK4
 SDvVd5e0150rwYewbq+DsFK3frIYOG5SX6HN9BaLhVvd3vwCmrAnC3PoxI2sD4j4uNqX
 5EMYKvnnMmd95YfKhE1dM44Fzwap2ygjtdKBzCLirgKWHiGYnKemGVp9hq6IsL59iU2V
 X3UZlVy2HJxDiz7/YrvBkRz77XWOLJ77jsf2S8FQ0anVH2r26eX84KzTevp62JW/eRmX
 komA==
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
Cc: Dave Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nathan Huckleberry <nhuck@google.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTo1MCBQTSBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCA0OjEzIFBNIE5hdGhhbiBIdWNr
bGViZXJyeSA8bmh1Y2tAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGV5IGFsbCwKPiA+Cj4g
PiBJJ20gbG9va2luZyBpbnRvIGNsZWFuaW5nIHVwIGlnbm9yZWQgd2FybmluZ3MgaW4gdGhlIGtl
cm5lbCBzbyB3ZSBjYW4KPiA+IHJlbW92ZSBjb21waWxlciBmbGFncyB0byBpZ25vcmUgd2Fybmlu
Z3MuCj4gPgo+ID4gVGhlcmUgYXJlIHNldmVyYWwgdW51c2VkIHZhcmlhYmxlcyBpbiBkcHVfZm9y
bWF0cy5jCj4gPiAoJ2RwdV9mb3JtYXRfbWFwX3RpbGUnLCAnZHB1X2Zvcm1hdF9tYXBfcDAxMCcs
Cj4gPiAnZHB1X2Zvcm1hdF9tYXBfcDAxMF91YndjJywgJ2RwdV9mb3JtYXRfbWFwX3RwMTBfdWJ3
YycpLgo+ID4gVGhleSBsb29rIGxpa2UgbW9kaWZpZXJzIHRoYXQgd2VyZSBuZXZlciBpbXBsZW1l
bnRlZC4gSSdkIGxpa2UgdG8KPiA+IHJlbW92ZSB0aGVzZSB2YXJpYWJsZXMgaWYgdGhlcmUgYXJl
IG5vIHBsYW5zIG1vdmluZyBmb3J3YXJkIHRvCj4gPiBpbXBsZW1lbnQgdGhlbS4gT3RoZXJ3aXNl
IEknbGwganVzdCBsZWF2ZSB0aGVtLgo+Cj4gV2UgY2FuIHByb2JhYmx5IHJlbW92ZSB0aGVtIGZv
ciBub3cgYW5kIGlmIHNvbWVvbmUgd2FudHMgdG8gYWRkCj4gc3VwcG9ydCwgdGhleSBjYW4gZHJl
ZGdlIHRoZW0gYmFjayB1cC4KClllcCwgdGhpcyBoYXMgYmVlbiB0aGUgZmVlZGJhY2sgZm9yIG90
aGVyIHBhdGNoZXMgZm9yIHRoaXMgd2FybmluZwp3aGVuIHRoZSBjb2RlIHdhcyBkZWFkIG9yIG5v
dCBvYnZpb3VzbHkgc29tZSBraW5kIG9mCmJ1Zy90eXBvL2NvcHktcGFzdGEuCgpOYXRoYW4sIHBs
ZWFzZSBzdWJtaXQgYSBwYXRjaCByZW1vdmluZyB0aGUgZGVhZCBjb2RlOyBpdCBtYXkgYmUKcmV2
ZXJ0ZWQgbGF0ZXIgd2hlbiBpdCdzIGFjdHVhbGx5IHdpcmVkIHVwLiAgTm90aGluZyBpcyB0cnVs
eSBsb3N0IHcvCmdpdCouCi0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxp
c3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
