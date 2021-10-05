Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5B4421BAB
	for <lists+freedreno@lfdr.de>; Tue,  5 Oct 2021 03:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA336EB10;
	Tue,  5 Oct 2021 01:17:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA966EB0F
 for <freedreno@lists.freedesktop.org>; Tue,  5 Oct 2021 01:17:52 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id z11so24062602oih.1
 for <freedreno@lists.freedesktop.org>; Mon, 04 Oct 2021 18:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DyHwOCOA8BVm3fIYmBKTBAquJnq6mmMC7RLAt62EphM=;
 b=j+McTh5xfKHvrsJdmlG/yhTupZ+rcdzKeHReBzcH/jlLl72oa1rOvM00PCQWPaVdYC
 22ECc8DMmYf7ZlrCGWGnmIpgW32iKqfbiL6qfO36V02wstCKYAEyFe1ZgDvVxkYOA9ZX
 Y2m+6bhS0klquWQRUC50h15O86r7fipHYxmrJP/7mT6Lz7/IolgDCX9jTX10842uDgPQ
 QJutAmWSRoZ6Zjgx4NT0hmZxnR73+PqKgIgcw/u6yMe5yKz5zbRDVLI19bItUwCBptBn
 iHKEiHYMPd6EyUaoDDEa9gPiB3dKx96Nh7ue9kGfvDGRuvz2X5wWQTCYXsRAWgdpayHa
 +VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DyHwOCOA8BVm3fIYmBKTBAquJnq6mmMC7RLAt62EphM=;
 b=X2KO4VIMivSSqMFy0VsnTktspAzk76+6Lsbe4FeFgdmfzvVnJPTW3OVSxuetE4HR7R
 cuavK0eay0fyWsXXUvObzKO5ZEtVt1xnLqlxbazN98EMZVpvbBfZv0RR9PQUCFWH+N1l
 GbAI5BnZMPz5EoKSOGFk5+ZdoK+iJF6UQedGxWfZAsH5mVnn9nQxPIfMI8wKCCW2R6D2
 Fm/SzVV9gcvp6L3Rp7GT06VTeRtklYTe2P6ojBkud7USH6H4kRrV1lj/4bJ3VnB2sG1M
 FKW1Qjh0sdqOAKZt7eHXHUHdCyGZyUMM2mJ8ERQt0YW5960qb145D+qWVTgfkqnqx+fl
 8cow==
X-Gm-Message-State: AOAM530IuJ8V1okF4wmDmOOlNwLCRokTmul1Wr3+38FaOuO+JAHZjWhN
 T4dnnpFq3OiQ1S/5ifTQSiGtiw==
X-Google-Smtp-Source: ABdhPJwmQ7OVkAOxHeWgbzi4LvP7Fh8PsrcgGBo70cF0RyffToZ8fe55VvlWng17Yi5qBj2+JaHZIw==
X-Received: by 2002:a05:6808:2128:: with SMTP id
 r40mr279140oiw.24.1633396671777; 
 Mon, 04 Oct 2021 18:17:51 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id z10sm3263522otq.64.2021.10.04.18.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 18:17:51 -0700 (PDT)
Date: Mon, 4 Oct 2021 18:19:34 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <YVuoJgquTnCYviRo@ripper>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
 <20211001174400.981707-4-bjorn.andersson@linaro.org>
 <CAE-0n52bY27rZzarqrgjh37W3SsyvKTH70H++SmqoZOyETZKPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52bY27rZzarqrgjh37W3SsyvKTH70H++SmqoZOyETZKPw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v3 3/5] drm/msm/dp: Refactor ioremap wrapper
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

On Mon 04 Oct 18:04 PDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-01 10:43:58)
> > In order to deal with multiple memory ranges in the following commit
> > change the ioremap wrapper to not poke directly into the dss_io_data
> > struct.
> >
> > While at it, devm_ioremap_resource() already prints useful error
> > messages on failure, so omit the unnecessary prints from the caller.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> I realize this will cause some prints when we use old DTs. I suppose
> that's OK though because we'll have more incentive to update existing
> DT.

The use of the current binding is fairly limited, so I think that makes
sense. Abhinav also requested earlier that we do that and drop the
fallback sooner rather than later, which I would like to see as well.

Thanks,
Bjorn
