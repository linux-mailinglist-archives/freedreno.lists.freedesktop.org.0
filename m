Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93408B400BA
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 14:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94EA10E6BB;
	Tue,  2 Sep 2025 12:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FnqfdZwc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F8B10E6B8
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 12:35:08 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3ea8b3a64c1so22127855ab.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756816507; x=1757421307; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VKhp7VVmF8ME0F2FS7jhf6Si4OKXqgIth6frK1IO0w8=;
 b=FnqfdZwc7ZDOxJmsVQbWr2Mjlj1rQmo3CTLOcTpohC6rYxpfVs4jdDc5DAvHRb+jKh
 CBbUoqwgri369Lwc7IlcpPN37qVvgJ6RVoIMEnvlbA7XC1MFAjKdR3G1UFdAVP+wRsE2
 80oSmYXpmhLC4NklVFfOU4qme+06RNbYO68CdvRPNw4SHWBjcorOUfW8NwhKrQeRESiN
 oRKjAVOa+oPO3c1u0oMShVcDKE81U4MRXXGcaK36IfaIfBduVflq5tVCvSWOD4eOiVW4
 aib73ViOOHwqi89suqJwk/eh+ZTu72ICxy53u/1USIIX+aB2wf/sOidWRrYExQ8VnOr1
 9yGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756816507; x=1757421307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VKhp7VVmF8ME0F2FS7jhf6Si4OKXqgIth6frK1IO0w8=;
 b=uYSOrN0IujvD1M5EBlZEgeY/aj4LvHofuVpkdR8hwbKuf254HVleB+eqpue/2HnNxn
 GmzLJ/ajjGUTGR1Xbsbtidu7icYpVGQuV6N6bvhC4KFPU0Wbwk7Uiknz3vVOTajZ9/TJ
 JkCHeV3i8vQP/C28kS0gbr5/BvJG/420L1z++yiM7nm7AZJg0mvHYOeFcqAI7jWS3LTM
 wzW7G7gBMuf6TfddErx06i4zVwX5JciNFINZsJXuSmidNC69j7OIu+av4T3Z4Hb96HRb
 wmSD2odyqwpc3rNarm2gfpFp/brtKfqjXc7zqzeSp/clrs5c3C63k+GLu76HT5h7dA3I
 W7qQ==
X-Gm-Message-State: AOJu0Yy4bWRyBrgiazlmoAs3a8lzdarWud6ORIaQYMkSch67lN8facMd
 +6q2L/rwfoV4rf9UBWHB9ABvHvQ9A7sbSHhPu6WSAdvgjwuwkQ9YnHifdmNBoAkybt75vDY2dSy
 6T51mxWkJHYARZNona8bTvEhuFCbPbKM=
X-Gm-Gg: ASbGncud+2xrC0mbNftygwnYG16xseKhcPEXVsSTJzLVnthQRPw/qpC3QNb/XI/zrvQ
 qqmAXKa+st7Bha8Tq0OU56Tz0K/KwHw4RVhn5DfwuUEnREBE4/nM/uvdsmROo+GtaCKOAWWlPHH
 VnVH1C39n4oyuBXQzy+aSIY+TlkjRo5BROJmZGYfdQuAISSTGvF69kHIlBozTMi8PcqQJZL4yAL
 JmWlaVhffhL5ZE6w6GBzHxwXbKHzoVpJ8Z+wTI=
X-Google-Smtp-Source: AGHT+IFpJTaBkpOtRYCWjOPxmbz9xs9shWJ1gD/X1/gyShe7OJCoqL98ALPBxaK2YdP0ORHFNftj9+nLS2IXGnA+HsI=
X-Received: by 2002:a05:6e02:1c22:b0:3f3:3ff:c106 with SMTP id
 e9e14a558f8ab-3f3fd18a753mr154219375ab.0.1756816507438; Tue, 02 Sep 2025
 05:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <_nEiLyt_fbZ0CN7Q0eY38EYzdVG7p41pdKvQpy31wVnPk-814QJ7jzhAksv3pxJ8FUCatjOnP_klgyHGY2r1wTn-a4rjN2AOKR3LsP4bhWk=@proton.me>
In-Reply-To: <_nEiLyt_fbZ0CN7Q0eY38EYzdVG7p41pdKvQpy31wVnPk-814QJ7jzhAksv3pxJ8FUCatjOnP_klgyHGY2r1wTn-a4rjN2AOKR3LsP4bhWk=@proton.me>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 2 Sep 2025 05:34:55 -0700
X-Gm-Features: Ac12FXyVIZ0KpZyAOd_W2A7UK9vG128tk0uR_DOZtRjIXRflTxJ3abrUF_rjEhQ
Message-ID: <CAF6AEGuM_Tr3JMtzfxmuoCMwhw8zp81yyrvJ22rCeQvTZ72oMA@mail.gmail.com>
Subject: Re: Adding support to Adreno 1xx GPUs
To: Ahmed.mekkakia@proton.me
Cc: "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Sep 2, 2025 at 5:26=E2=80=AFAM <Ahmed.mekkakia@proton.me> wrote:
>
> Hello,
> I am working on making linux for the Xperia X1 (HTC Kovsky) a thing , pro=
blem is I have implemented a few drivers except for graphics as they are un=
documented and the android drivers are hard to figure out with decompiling,=
 and since your project is for adreno graphics on linux, i would like to kn=
ow if it was ever attempted, or if you plan it, if neither, do you somehow =
own any documentation for the adreno 1xx (more specifically 130) graphics?
> Thank you.

wikipedia says that adreno a1xx is fixed-function gles1 gpu, so
probably very different from a2xx and later... it also sounds
unrelated to the 2d core that was sometimes paired with a2xx.

I don't have any docs on it, and have never seen the kernel mode
driver for it.  Mesa/gallium is not well suited to old fixed function
GPUs either.  So no real plans to support it.

BR,
-R
