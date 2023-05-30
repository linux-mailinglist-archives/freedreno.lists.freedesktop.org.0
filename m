Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5BC716E79
	for <lists+freedreno@lfdr.de>; Tue, 30 May 2023 22:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4824F10E420;
	Tue, 30 May 2023 20:14:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B9910E41B
 for <freedreno@lists.freedesktop.org>; Tue, 30 May 2023 20:14:31 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-565ba6aee5fso58495137b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 30 May 2023 13:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685477671; x=1688069671;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n9PhFw6EqXKj/DjQH85Ps097cPd6lOxV2adiWzAyXMY=;
 b=uP+H06dQN5AfH4nA+D3U5/f29oBlCpAgAY/Sfdkkn0KucPXUsBlr9QZUOMcexRO8hF
 rRPysPENw6yKThs+UJo0kSvEiXkxkRyiKjj8BISN7UUkHrBpuk9Osq0pT2Xjln76ayx/
 CNuipU9ccvJtgvkFumt3DfVxA5babPUSCwDzRdpz7sC8RYnpAVzlCDSboYPtivbsimEA
 DRGIB6whPv4RTPBI2DyOCrsWVuE3UzvezGOEr+NKjVu5wa5uTaph3ufEuGSUMaXDVWwU
 TglC+zULylPkTFZ6Dh8dCWwQlZa8UMiJeQfuq8gjH57ZtTHAa+vjMDvc/oYwu6zr0B4R
 Qc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685477671; x=1688069671;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n9PhFw6EqXKj/DjQH85Ps097cPd6lOxV2adiWzAyXMY=;
 b=Fq2RvbSkszDTYRPTcShuBJHLligaWiCmkOvt+IbNOeOQ9bsaAfI8S0j4jzp7Unlp7g
 UF0d6IKtMvZ0g4QHvB37UvPdkRD6ypr1JjKD7jkE98r1W4mO+fHVhVsJgbASTHMnPwl8
 7x66QIgvTL8CEGZZGJmElF9GNIckn20XYlKmBQ8LZ/o3dim1o5WWMppMgajYVjsAieXO
 QJF4iyOIvq2n8mG72k9zJonHn0uV/L69s3BHV+7KzCNm160oFPpf76WdcsX3fFg1hQhb
 pXQN7oM5+SBHfOHspEFZ6ruf57HIlClDI6q9pq4PQkRvre1FltVHpzofZFATCirl7rlE
 hYYA==
X-Gm-Message-State: AC+VfDy+h7zaJ1QbLJMyKHQGn0pPt88DW2mCkuGLGO9/WYqJlC5thyeS
 e5S0GKQlRW6K4Mut5kr0eQkqBVYTuG5mz0apPV4zNw==
X-Google-Smtp-Source: ACHHUZ59cFtiwvOV4dMWsQ/BceJCxYHiJSRU7xd4rWZLxQAVVu325eR1vgGEksuIHWnmsEl+0Yvy5dpYVHm9Y/ZjG3k=
X-Received: by 2002:a81:c310:0:b0:561:7351:f56f with SMTP id
 r16-20020a81c310000000b005617351f56fmr3759086ywk.24.1685477670706; Tue, 30
 May 2023 13:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
 <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
 <c18c8687-0c4e-894e-a629-bc55e54031c5@quicinc.com>
 <6se25tikdg2tkiprz4h4umfta34tc5orddksvwi6woklf7c74k@rbserwp5kt3a>
 <9001aaaf-778e-5b3c-e87f-2b196d8b62ed@quicinc.com>
In-Reply-To: <9001aaaf-778e-5b3c-e87f-2b196d8b62ed@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 May 2023 23:14:19 +0300
Message-ID: <CAA8EJpp2mGcOHf5KJ8Zt_MQK+grAvbb=tVtaiT7MBLzCis20fg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 30 May 2023 at 20:37, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/29/2023 2:36 PM, Marijn Suijten wrote:
> > On 2023-05-24 12:18:09, Abhinav Kumar wrote:
> >>
> >>
> >> On 5/24/2023 2:48 AM, Marijn Suijten wrote:
> >>> On 2023-05-23 13:01:13, Abhinav Kumar wrote:
> >>>>
> >>>>
> >>>> On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
> >>>>> Drop SSPP-specifig debugfs register dumps in favour of using
> >>>>> debugfs/dri/0/kms or devcoredump.
> >>>>>
> >>>>
> >>>> I did see another series which removes src_blk from the catalog (I am
> >>>> yet to review that one) . Lets assume that one is fine and this change
> >>>> will be going on top of that one right?
> >>>
> >>> It replaces src_blk with directly accessing the blk (non-sub-block)
> >>> directly, because they were overlapping anyway.
> >>>
> >>>> The concern I have with this change is that although I do agree that we
> >>>> should be in favor of using debugfs/dri/0/kms ( i have used it a few
> >>>> times and it works pretty well ), devcoredump does not have the support
> >>>> to dump sub-blocks . Something which we should add with priority because
> >>>> even with DSC blocks with the separation of enc/ctl blocks we need that
> >>>> like I wrote in one of the responses.
> >>>>
> >>>> So the "len" of the blocks having sub-blocks will be ignored in favor of
> >>>> the len of the sub-blocks.
> >>>
> >>> The sub-blocks are not always contiguous with their parent block, are
> >>> they?  It's probably better to print the sub-blocks separately with
> >>
> >> Yes, not contiguous otherwise we could have just had them in one big range.
> >>
> >>> clear headers anyway rather than dumping the range parent_blk_base to
> >>> max(parent_blk_base+len, parent_blk_base+sblk_base+sblk_len...).
> >>>
> >>> - Marijn
> >>
> >> When I meant sub-block support to devcoredump, this is how I visualize
> >> them to be printed
> >>
> >> =========================SSPP xxx =======================
> >> =========================SSPP_CSC =======================(for SSPP_xxx)
> >> =========================SSPP_QSEED =====================(for SSPP_xxx)
> >
> > Yeah something along those lines, though I don't really like the `(for
> > SSPP_xxx)` suffix which we should either drop entirely and make the
> > "heading" less of a "heading"
> >
>
> I wrote that "for SSPP_xxx" to explain the idea, ofcourse it wont be
> part of the print itself.
>
> Without that, it matches what you have shared below.
>
>
> > ========================= SSPP xxx =======================
> > ...
> > ------------------------- SSPP_CSC -----------------------
> > ...
> > ------------------------- SSPP_QSEED ---------------------
> > ...
> >
> > And/or inline the numbers:
> >
> > ========================= SSPP xxx =======================
> > ...
> > ----------------------- SSPP_xxx_CSC ---------------------
> > ...
> > ---------------------- SSPP_xxx_QSEED --------------------
> > ...

I'd prefer this format. It eases grepping.

> >
>
> sure this is also fine with me.
>
> > Either works, or any other pattern in the title (e.g `SSPP xxx: CSC`)
> > that clearly tells the blocks and sub-blocks apart.
> >
> > - Marijn



-- 
With best wishes
Dmitry
