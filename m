Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225EB523C38
	for <lists+freedreno@lfdr.de>; Wed, 11 May 2022 20:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA695112752;
	Wed, 11 May 2022 18:09:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E835D10EA67
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 17:40:03 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ch13so5462913ejb.12
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 10:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RnK+iHlohBHk+K+PPu2H+s8rv61aQCy6hHkZXbGO1nI=;
 b=KSDW7EaxEEAox9ArNl/cG0HEgm3SfZ3GtqPNzdmMU8fD7w0C0oDZs3MEyYZ6yoLdeu
 yShjYNBWL3FgGR6nQX6mpwU5Yirj2LjWdpRYv8a8UxBup5whzO4smQ6iqzPoBSfjp87S
 7RlaOLEm4NKQMZeXbACuJSvVt1Ssh4WSaqYVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RnK+iHlohBHk+K+PPu2H+s8rv61aQCy6hHkZXbGO1nI=;
 b=qOCP0RFKEqSAsp0k9PrW73q9xBM5bI2bkfvF8gz/wnGKIajMItEAppV9NroYECiwgx
 uVgiCcJFUjQkrmG5ohxQaMQVIXXKIBNlwHAX9keanFSAbeRKkAiscRjOCpxjD8fSLW4C
 AfXN7+xh8UOBofFD+lf8FcxKEm2asobkreiJJSos4D+TwT+2ediKFKBSUc2mOJcdLKVc
 F59+TPjmoc0wj+wW8QpAhd6wmu3Fg3GDwwoewr5mbgRzWSlTIET8esJhrLJJAy3khpDN
 2rJe1Vd0QmG/PBgCgwbta/7v8h1ZDpg10dHnGzTNDOT3glC6BYRqvzlup0PH7Cuk7Kc0
 GIMA==
X-Gm-Message-State: AOAM531TxIdBDpeFynR6PNJJTVxE1dQ5Drr1DTnyJiSAd+7rCvkvrIDL
 CIcgkC+ONW/30M4Nes1P1lLo+mg/NNB4gKdpHBQ=
X-Google-Smtp-Source: ABdhPJxMme/8XtLgh0r68eVhkjmhrkCPDgdAPbLwZ/ftzFA03J218o3CZ8uvT+Y96IfgL1hloIdsYg==
X-Received: by 2002:a17:906:19c3:b0:6ec:c7b:ed28 with SMTP id
 h3-20020a17090619c300b006ec0c7bed28mr25434963ejd.612.1652290802146; 
 Wed, 11 May 2022 10:40:02 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 j6-20020a17090643c600b006f3ef214e4bsm1237006ejn.177.2022.05.11.10.40.01
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 10:40:01 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 l38-20020a05600c1d2600b00395b809dfbaso1368172wms.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 10:40:01 -0700 (PDT)
X-Received: by 2002:a1c:4c06:0:b0:394:65c4:bd03 with SMTP id
 z6-20020a1c4c06000000b0039465c4bd03mr6060279wmf.8.1652290402369; Wed, 11 May
 2022 10:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
In-Reply-To: <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 May 2022 10:33:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
Message-ID: <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 11 May 2022 18:09:34 +0000
Subject: Re: [Freedreno] Adding CI results to the kernel tree was Re: [RFC
 v2] drm/msm: Add initial ci/ subdirectory
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 10:07 PM Dave Airlie <airlied@gmail.com> wrote:
>
> > And use it to store expectations about what the drm/msm driver is
> > supposed to pass in the IGT test suite.
>
> I wanted to loop in Linus/Greg to see if there are any issues raised
> by adding CI results file to the tree in their minds, or if any other
> subsystem has done this already, and it's all fine.
>
> I think this is a good thing after our Mesa experience, but Mesa has a
> lot tighter integration here, so I want to get some more opinions
> outside the group.

Honestly, my immediate reaction is that I think it might be ok, but

 (a) are these things going to absolutely balloon over time?

 (b) should these not be separated out?

Those two issues kind of interact.

If it's a small and targeted test-suite, by all means keep it in the
kernel, but why not make it part of "tools/testing/selftests"

But if people expect this to balloon and we end up having megabytes of
test output, then I really think it should be a separate git tree.

A diffstat like this:

>  7 files changed, 791 insertions(+)

is not a problem at all. But I get the feeling that this is just the
tip of the iceberg, and people will want to not just have the result
files, but start adding actual *input* files that may be largely
automated stuff and may be tens of megabytes in size.

Because the result files on their own aren't really self-contained,
and then people will want to keep them in sync with the test-files
themselves, and start adding those, and now it *really* is likely very
unwieldy.

Or if that doesn't happen, and the actual input test files stay in a
separate CI repo, and then you end up having random coherency issues
with that CI repo, and it all gets to be either horribly messy, or the
result files in the kernel end up really stale.

So honestly, I personally don't see a good end result here.  This
particular small patch? *This* one looks fine to me, except I really
think tools/testing/selftests/gpu would be a much more logical place
for it.

But I don't see a way forward that is sane.

Can somebody argue otherwise?

            Linus
