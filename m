Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAB23BED2B
	for <lists+freedreno@lfdr.de>; Wed,  7 Jul 2021 19:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA756E15D;
	Wed,  7 Jul 2021 17:34:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234806E15D
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jul 2021 17:34:36 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id g3so3696710ilj.7
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jul 2021 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sD13z85XVgoLdSGSEXdyjIhfF8nDl4He7AW/wdIYAPE=;
 b=GMyUr6TlJ9VJExoTQpjFfBsLf6J01HTyZta3543eDwhlqbYEzWxs8GoDpUc1UsSTw4
 l1VVQLqIkdx353vwBODZcBzPc+/pWN2sN4WUmOL2Q2pzqXNGKMgaACFtiLtqRBNiBa9g
 MO2krDbX2BQp90Nsue1zk7vA6Wepr7RZf2O7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sD13z85XVgoLdSGSEXdyjIhfF8nDl4He7AW/wdIYAPE=;
 b=ZXtV6k0hoVMZQaSthtWfj59VzHz+5pb4l6Rv5LeCDjoJgvYxmx6PHOaxC4R8RQ+bXQ
 MMTa3lWm6aDst3rOOqNtpJpI3s1BzflztuhgWV7zH4noyGTvuMJxs01AIRt6lSpk8GPz
 YPiEFe8eZB7NkQNXfyWfAaPVOuhnaIo9LvzSZOyCV6f8UhwwycVf4MrCt+OFg4arfagK
 OXxrsrDmaBx2QPdx3i3FgiUKrjeW9GRz2/755e27Ues3eFTFF/pYMgRigj2rV9N1AelZ
 KryO33x/MItHIgiSJc4yZe8NmkvqQADRzbWBiNneXTnG6TiHzkygj7mvgAl0RFwwZtGg
 TwNQ==
X-Gm-Message-State: AOAM5307bGzXWhRFuIydLkLlTK86oBS1JZmEIug/YCl+ER/XoCxpURL9
 LPMBZqxJnWGM32vTMSsT5Dq6r61WrUwd8k/hT4KkZw==
X-Google-Smtp-Source: ABdhPJxjcG9AfhjNI0K88JMDlGt/CX21XaqIJd0EGqm1e9KWBmc9XPZNa/mXbdXJb612yvG28vh3Q4PQfEPrvTUr3HA=
X-Received: by 2002:a92:6f0a:: with SMTP id k10mr18648951ilc.105.1625679275706; 
 Wed, 07 Jul 2021 10:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210610214431.539029-1-robdclark@gmail.com>
 <2016473f-2b38-f049-1e8d-04bdf5af6cea@linaro.org>
 <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
 <CALAqxLWDqQeD-eieHXtePuXpxN1s3=jCNJP2pJD-YswsLP-mJw@mail.gmail.com>
In-Reply-To: <CALAqxLWDqQeD-eieHXtePuXpxN1s3=jCNJP2pJD-YswsLP-mJw@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 7 Jul 2021 10:38:38 -0700
Message-ID: <CAJs_Fx4n07yuksL+kmjyKRuqPnFuE1m5PmeqCsoF7Xah=kWxvA@mail.gmail.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [Freedreno] [PATCH v5 0/5] iommu/arm-smmu: adreno-smmu page
 fault handling
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Douglas Anderson <dianders@chromium.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 10:12 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Sun, Jul 4, 2021 at 11:16 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > I suspect you are getting a dpu fault, and need:
> >
> > https://lore.kernel.org/linux-arm-msm/CAF6AEGvTjTUQXqom-xhdh456tdLscbVFPQ+iud1H1gHc8A2=hA@mail.gmail.com/
> >
> > I suppose Bjorn was expecting me to send that patch
>
> If it's helpful, I applied that and it got the db845c booting mainline
> again for me (along with some reverts for a separate ext4 shrinker
> crash).
> Tested-by: John Stultz <john.stultz@linaro.org>
>

Thanks, I'll send a patch shortly

BR,
-R
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
