Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DD3803291
	for <lists+freedreno@lfdr.de>; Mon,  4 Dec 2023 13:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F6510E1BC;
	Mon,  4 Dec 2023 12:26:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8562B10E1BC
 for <freedreno@lists.freedesktop.org>; Mon,  4 Dec 2023 12:26:27 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-db3fa47c2f7so2718131276.0
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 04:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701692786; x=1702297586; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tFWyFPjADp1Fc6HbLi6uPiaZmfeg0/fMint0EXwMSxg=;
 b=w0/ImTECyidqeBC9pzoR02PqZP+eipTwOxTR5xgVcr02OL+HgHFiFm+apIubVyPbtA
 JcwsEP/X4oiPe4H5A9QWzHML2QYaYFI+ORcz+xpHyOVG73MZotrtT+mdVy2Dt/VMp/iQ
 XMmsr7hZUzY1JKExsNBU++NsLoaC5rbdw6WfJ904noW2OeCKT+V1FMIK2+/+4B5gM/U8
 xgN+a7yUEhXVppBtwRtk4NorB9llxc1yCCJFpyFd1CUYEWstifJkSSUS0hhcivvJKBj+
 fiZf743+O+li1C3OX7tpBql0p739UEkdYwd39kjlh1D+Wbw1AYSrRar/dNc87Y9Ep7w/
 MEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701692786; x=1702297586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tFWyFPjADp1Fc6HbLi6uPiaZmfeg0/fMint0EXwMSxg=;
 b=TG/D0Zd++Lmro7+v5hODMhwjSHJYiYP/2UPKYa6cgWfB2ehkfiG5l2nv3u6VMhoY85
 VgcuoWL5tspbnnnCRuxZ7VDgmX0/TBJoJFaKjYqjH09H+Ztn6bggLFrzxVlDrdfTIDdV
 CFDyXzZ9iyrVoFsD7cVZy56jqa/UVHYAqv9GQ/hgWBpAeVYtjIfVK0A4XJCo1naa0GSm
 SbGdIysksYwVX4zuVtdZ2afvxeSigZZmSPwmkh3i8WbyplfH503xhBrzB2fUphwpPW5J
 ueI1byj+S6zHul/LJohSO0ans4lL7nvvc+wrLrjujkmZDkuWBfy0n6F7gEw/7A/KadbZ
 ui7Q==
X-Gm-Message-State: AOJu0YyYjxA+MK/gKWN/lX2OuLTFswua55txfdxkqx5m29H10Gse0Xw7
 7KEgxWU0nqI7SrDRAm9ZM1+5iA1fbDio8FfSOQwVSA==
X-Google-Smtp-Source: AGHT+IE+L1664SYHtY+cUpFkqq4X1I85OOyU1mq606IScbstXyiJjcP/Vfcc7mySBINjIKn/y2Cz19SvoVwqk/DjCeM=
X-Received: by 2002:a25:d85:0:b0:db5:4d4f:b3bb with SMTP id
 127-20020a250d85000000b00db54d4fb3bbmr1816647ybn.18.1701692786300; Mon, 04
 Dec 2023 04:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
 <2023120426-frosting-manliness-14bd@gregkh>
In-Reply-To: <2023120426-frosting-manliness-14bd@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 14:26:15 +0200
Message-ID: <CAA8EJpriJ-Y0Gb+PW7f5p4Sh_BXsDpeDckgnGZ+eKmWTQBegaA@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH RESEND 0/6] drm: simplify support for
 transparent DRM bridges
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Simon Ser <contact@emersion.fr>, Bjorn Andersson <andersson@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 4 Dec 2023 at 14:21, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Dec 03, 2023 at 02:43:27PM +0300, Dmitry Baryshkov wrote:
> > Greg, could you please ack the last patch to be merged through the
> > drm-misc tree? You have acked patch 3, but since that time I've added
> > patches 4-6.
>
> That is up to the typec maintainer to ack, not me!

Hmm, true. I didn't notice supporter vs maintainer.

Heikki, then we should bug you about that patch.

-- 
With best wishes
Dmitry
