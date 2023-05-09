Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92A96FC4AA
	for <lists+freedreno@lfdr.de>; Tue,  9 May 2023 13:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65DE10E389;
	Tue,  9 May 2023 11:12:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595E510E389
 for <freedreno@lists.freedesktop.org>; Tue,  9 May 2023 11:12:21 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-b9ef06cb784so7371495276.0
 for <freedreno@lists.freedesktop.org>; Tue, 09 May 2023 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683630740; x=1686222740;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O+AtwPwXPZlp/x5nJkkCBaOlYDV83aySbZPDW4HW+Ks=;
 b=HOmFRHQ2CGgJGUmh5sxSRX/cHyAlfs0He1YcCwUGt/kvIdjXiZVz7xhA+MnwFqMURm
 XETqZd8VkjC55dbMw6IcaJGxixIgQL1p9+Cd4Y7GjdlyFLhAwaTVYHZrrRBQZNnY6GRa
 BEWFlXxrA7LQAvwKR/RwkoPq7S24CBVL/TE48aIROCvrcu0apEzL9KzyhLrvCtgTk7eU
 GOhZx8fpt9fn7m+Ca8mfsyrbQ5Mdteum0XLGOQAU4bm2M4bmiouLjHma1F1lrbkDhp3m
 9/fmviKxf3yNj3OoB6y5dTF92i3KSYLxRHnDclg+hbFWH6QqXKutinXVcIzaw7ek7WUJ
 mCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683630740; x=1686222740;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O+AtwPwXPZlp/x5nJkkCBaOlYDV83aySbZPDW4HW+Ks=;
 b=jFH2i6S6askMeb38AnCSqkFx9lTn91HztLODdprk1w08hGuCG5VqrB7I+2FlgEzrxw
 Jhiz1F1y9ij7GeX1dPGlQmtfUuiJAaxUaErN1CfQbx+RcTgOUXqYHXItUc8QyTacPLwV
 YFqEqi/jrtMPfO6F2wD3sFzl5sr7saC/Nw+6jKzS8U8Gwt0dwOol8MZzfW66jnLIUz5U
 aPU+3ABrmkdszmmlMUFArtSjerD5Sw8SXUATekK/vhpkeTZGFpJuHLT9R/7k+WblchOf
 uoqa9v25N0HayF2RZxnh+kNsgGrIMiphYPTn2oan1rQbZAErccemr6TQJlJuZ5qxvh4L
 wbXA==
X-Gm-Message-State: AC+VfDzw9L2jfwky7CjxGBExxlyOH7Mkb99HEoi0W+Pro0sB8lICfqok
 KoVdRm5/q/QrEC89fwqfQI7R+e88PGWncTooMKKjvw==
X-Google-Smtp-Source: ACHHUZ7LNWGXsH5ngDCkMQSeQBUdW9HlHh4f1cvgaN8Fn0DQyw7TEC/v0WbmUraisWvo/nYB5xTL7/87v2KHSJ9yXrU=
X-Received: by 2002:a25:ade5:0:b0:b99:93d5:26dd with SMTP id
 d37-20020a25ade5000000b00b9993d526ddmr14771104ybe.20.1683630739827; Tue, 09
 May 2023 04:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
 <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
 <1d7ccb5f-55c2-3b3a-df97-2c17beffabfc@quicinc.com>
 <0aa4130d-bb37-4743-10e5-fd518276f4a2@linaro.org>
 <chw4jhkwbtml3w3ha6beubvvil4jsr7wuzahfif2mzkcmsqhwj@wgm7axq2o6wk>
In-Reply-To: <chw4jhkwbtml3w3ha6beubvvil4jsr7wuzahfif2mzkcmsqhwj@wgm7axq2o6wk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 May 2023 14:12:08 +0300
Message-ID: <CAA8EJpoW_rrvTP8kt2gHKZA+0Jez0_dKay3XGs+3_CaHQK7+Wg@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm/dpu: Add
 DPU_INTF_DATA_COMPRESS feature flag
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 9 May 2023 at 10:00, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-09 02:08:52, Dmitry Baryshkov wrote:
> > On 09/05/2023 00:46, Jessica Zhang wrote:
> > >
> > >
> > > On 5/7/2023 9:00 AM, Marijn Suijten wrote:
> > >> On 2023-05-05 14:23:50, Jessica Zhang wrote:
> > >>> Add DATA_COMPRESS feature flag to DPU INTF block.
> > >>>
> > >>> In DPU 7.x and later, DSC/DCE enablement registers have been moved from
> > >>> PINGPONG to INTF.
> > >>>
> > >>> As core_rev (and related macros) was removed from the dpu_kms struct,
> > >>> the
> > >>> most straightforward way to indicate the presence of this register
> > >>> would be
> > >>> to have a feature flag.
> > >>
> > >> Irrelevant.  Even though core_rev was still in mainline until recently,
> > >> we always hardcoded the features in the catalog and only used core_rev
> > >> to select a dpu_mdss_cfg catalog entry.  There is no "if version >= X
> > >> then enable feature Y" logic, this manually-enabled feature flag is the
> > >> only, correct way to do it.
> > >
> > > Hi Marijn,
> > >
> > > Understood. FWIW, if we do find more register bit-level differences
> > > between HW versions in the future, it might make more sense to keep the
> > > HW catalog small and bring core_rev back, rather than keep adding these
> > > kinds of small differences to caps.
> >
> > Let's see how it goes. Abhinav suggested that there might be feature
> > differences inside the DPU generations (and even inside the single DPU
> > major/minor combo). So I'm not sure what core_rev will bring us.
> >
> > Let's land the platforms which are ready (or if there is anything close
> > to be submitted).
>
> You mean waiting for catalog changes on the list specifically, so the
> DSC series as well as SM6350/SM6375?  I do intend to send SM6125 now
> that the INTF TE series (required for it, as well as for SM63**) seems
> to be generally accepted, but have been quite busy with the DSC series
> on the list as we're now unblocking many Xperia's to finally have
> display!

Yes, please send it, as you find time. No time pressure.

>
> The catalog addition is "pretty much ready", let me know if you'd like
> it to be sent in prior to your cleanup.

-- 
With best wishes
Dmitry
