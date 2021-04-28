Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E85C36D902
	for <lists+freedreno@lfdr.de>; Wed, 28 Apr 2021 15:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F016E114;
	Wed, 28 Apr 2021 13:59:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1826E114
 for <freedreno@lists.freedesktop.org>; Wed, 28 Apr 2021 13:59:04 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id u80so29523831oia.0
 for <freedreno@lists.freedesktop.org>; Wed, 28 Apr 2021 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hkp8JPyq7iKOdx3agaKyk/nZwtc1iq2iKAqgAsmLo9o=;
 b=zkOrRMTj8vr++X/SyozrLDvCSxZvoFs44VJYVqI5/yijoEx0jC6XQpJZiFruyQT8Ah
 6QKKhJ8ox2SRg/T/O6428Iz9lC44qlHr5PTIyvx7Y0K6m4DdRNsnwT2TrdwUuPPwsHkC
 SMXZZmQSUTWS5HjM9vExRNvBxPArcV06t05tGm7WNcPMAsRy+1stb3wY9oxw4oGNIn4y
 rFkc+1MdwDxPW5Qcgve6MZ3GfZpErllMTncvT63GhchY9NGtmkE5ldrVoWKH9VCp0P0I
 e0vQgrWKC2b8ZCPWg4z+StCfsmb5JGE861cc6Hn3OlR1ENpJ8/+sGdHi98MrEuDuhXbm
 MVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hkp8JPyq7iKOdx3agaKyk/nZwtc1iq2iKAqgAsmLo9o=;
 b=c4niRlRR/8B6MPnmArnShpk7KRaqbC1+uA4/biU57kcpocUYGy4C/4Wa10EwfF+WK4
 jeHgndEoHVaDfyvAGbtYNu4UAmjhrLBJYWdqieDXlNpPYcUFwSDQjIyDUTVLjn9i1y/+
 8Go2ukZq30uiKHquRONiV8DGvLUU8ESH3Ap0GMOfQUVAtpIYVHltCjf75yv3yIoDX4+X
 fo2Fyjc9rhqaflraPueTdvlycS+QWiNMfgLWSX/mn4xuAraBDMmS7a3VA1whCyugug1B
 Plf7alYiMOstp3fioyrh0rfih2+X8IbNc6Fqjsmsija/VmEF+M9jov6jBrdNhZB9HiBA
 EnoA==
X-Gm-Message-State: AOAM533rDHULAyqIvMoRe2TagaQx2XcOeBlab722dcl9o0N3caTs0W5B
 0Yi+fC2YIFJR8UBg1WIESXa5VQ==
X-Google-Smtp-Source: ABdhPJyvGFX8lyxoyrN/Yr95YZIBqU4KcCqXVw71nLljBeqX2mob8YGKbLikMcFtRl/YDjTPxSs9oA==
X-Received: by 2002:aca:4157:: with SMTP id o84mr2920512oia.65.1619618344263; 
 Wed, 28 Apr 2021 06:59:04 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id i9sm11330otr.19.2021.04.28.06.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 06:59:03 -0700 (PDT)
Date: Wed, 28 Apr 2021 08:59:01 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20210428135901.GK1908499@yoga>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
 <20210428024755.GJ1908499@yoga>
 <80622cc2-5585-abaa-42e0-cc6969ed6ae3@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80622cc2-5585-abaa-42e0-cc6969ed6ae3@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed 28 Apr 08:41 CDT 2021, Dmitry Baryshkov wrote:

> On 28/04/2021 05:47, Bjorn Andersson wrote:
> > On Mon 26 Apr 19:18 CDT 2021, Dmitry Baryshkov wrote:
> > [..]
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index 92fe844b517b..be578fc4e54f 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
> > >   }
> > >   static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> > > -				  const char *dbgname, bool quiet)
> > > +				  const char *dbgname, bool quiet, phys_addr_t *psize)
> > 
> > size_t sounds like a better fit for psize...
> 
> I was trying to select between size_t and phys_addr_t, settling on the
> latter one because it is used for resource size.
> 

I always thought resource_size_t was an alias for size_t, now I know :)

That said, I still think that size_t (in line with resource_size_t)
gives a better hint about what the parameter represents...

Regards,
Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
