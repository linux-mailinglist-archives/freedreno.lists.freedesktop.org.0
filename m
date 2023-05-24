Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9BA70F41D
	for <lists+freedreno@lfdr.de>; Wed, 24 May 2023 12:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB5C10E5DD;
	Wed, 24 May 2023 10:25:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E574110E34C
 for <freedreno@lists.freedesktop.org>; Wed, 24 May 2023 10:25:09 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-ba80dc46972so1165305276.2
 for <freedreno@lists.freedesktop.org>; Wed, 24 May 2023 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684923908; x=1687515908;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aD3IA34gk0OpiFHmxgq4cZFvvS4AtjdfxP/2AHXDei4=;
 b=v42rDL2b4iFPtfMW+oR7SNJkKip2850QFTsyU+q5ISKql7iMfcDOgzYLmSxd+gQ1JR
 CkdspAZLOO3Os6ylUoe4hFkaZkcJr6VQHUTeAmWwbZYUay70avJ9EeaqZcnPS0euhFZ0
 5K28BrG+uDp81w0CUW5E34Ly434xVGcQ8rJz69KgWBLv6B5yaNal/bTWkSJJoUKboLzk
 pf0AWWHRqco76CED95f8NppvdSLVdCytawDMaHQk/9Zi/sWiqefnd+sDROR/QiFkjwII
 SMeNqPlAPDUBv6DVWPfWqYJk+03cbUtGBx1AaLrNZRrPzhsIhuPvaS+C+6G1cEex/40K
 MZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684923908; x=1687515908;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aD3IA34gk0OpiFHmxgq4cZFvvS4AtjdfxP/2AHXDei4=;
 b=Z97D+EsFlZt3kX8G6oVTN/LqUZFa7EiGJ2y1hfWMepAP2/JGPQwbRI+cqmPsDnigzk
 8Ideu0sQl6uZpFWwkt2CuTHgOno2LWYZhAVTjdRrHoNaUKaVrwssPMqNCkIwxl39zgOp
 zjtd9SVaq4RP7bzqfii7wyDSQ6H6hnR6UxgpsOzU4SnXMj6IBRS17SMWdNviB5ZsXUqN
 F8rItiUiq72vUpnbriJ5tMjL+sPFzbqyqPV2Iu42MY6l3JOC3mRAgf2yFqdg3kGhexA0
 RG4jKd1AP/zp2lu7mj7LFqII2TiLGw4TJ+zDw9FmER2+aK/uyVptdVqqCdLz/4qwUEqF
 tXxg==
X-Gm-Message-State: AC+VfDwn29t4TfamToymICigFRuqOZTTRbnHNACmcN5vpP4YdrJQfNCh
 aCDzMaYsla7isqegbNcp1sbjl3EWRN4c3UdiBXilHA==
X-Google-Smtp-Source: ACHHUZ4xV9jRL3GEe5EA3g8bWvxcwLzA0YIwtlm12hu88MYwFnsVrU+nENvU+B1yodFngmQL9vL4RFxHDpW66Gpt3Is=
X-Received: by 2002:a81:8351:0:b0:559:f029:992d with SMTP id
 t78-20020a818351000000b00559f029992dmr18079445ywf.24.1684923908465; Wed, 24
 May 2023 03:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
 <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
In-Reply-To: <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 May 2023 13:24:57 +0300
Message-ID: <CAA8EJpoyZsEHJeh7wMrz3dYg3841AfR4LQEEhZff_zRpRQgAvw@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 24 May 2023 at 12:48, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-23 13:01:13, Abhinav Kumar wrote:
> >
> >
> > On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
> > > Drop SSPP-specifig debugfs register dumps in favour of using
> > > debugfs/dri/0/kms or devcoredump.
> > >
> >
> > I did see another series which removes src_blk from the catalog (I am
> > yet to review that one) . Lets assume that one is fine and this change
> > will be going on top of that one right?
>
> It replaces src_blk with directly accessing the blk (non-sub-block)
> directly, because they were overlapping anyway.
>
> > The concern I have with this change is that although I do agree that we
> > should be in favor of using debugfs/dri/0/kms ( i have used it a few
> > times and it works pretty well ), devcoredump does not have the support
> > to dump sub-blocks . Something which we should add with priority because
> > even with DSC blocks with the separation of enc/ctl blocks we need that
> > like I wrote in one of the responses.
> >
> > So the "len" of the blocks having sub-blocks will be ignored in favor of
> > the len of the sub-blocks.
>
> The sub-blocks are not always contiguous with their parent block, are
> they?  It's probably better to print the sub-blocks separately with
> clear headers anyway

I hope this is what Abhinav meant.

> rather than dumping the range parent_blk_base to
> max(parent_blk_base+len, parent_blk_base+sblk_base+sblk_len...).
>
> - Marijn
>
> > If we remove this without adding that support first, its a loss of debug
> > functionality.
> >
> > Can we retain these blocks and remove dpu_debugfs_create_regset32 in a
> > different way?
>
> <snip>



-- 
With best wishes
Dmitry
