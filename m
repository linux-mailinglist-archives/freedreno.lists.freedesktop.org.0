Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690A999EA1F
	for <lists+freedreno@lfdr.de>; Tue, 15 Oct 2024 14:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4873010E57D;
	Tue, 15 Oct 2024 12:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e6Bn6Zxt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A9410E57E
 for <freedreno@lists.freedesktop.org>; Tue, 15 Oct 2024 12:43:25 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so1662863e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 15 Oct 2024 05:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728996204; x=1729601004; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dWAWLMerFNg7ziMX/kkTq0c63ntBQBUxjKKx6kq8y/c=;
 b=e6Bn6ZxtrLxQiBoErjRAZmFYmomFapBbwdmw9VNFWXm84uSod91gK3xbBPCcsAKeFz
 GzMIBOXvCR/isAVxEmgvfec1ZxTfaxO1e9UXHzRKTt39Enjg5afLNIIneYicW3sRL5Fu
 joqdZz3mLQhBouSQX+bmqp44xIHW2yP8WfVCD3zoRzIBS5XG3lcH6DvkC+g0fYYbt4Sc
 kaBy/Fp9V27Esk8VZUPgUzpsV/3ggAK9DuoSC1e+kWPpZOrLPSaCzzhwaHiqnfdqUAUD
 N7OiQbdSoraSmeqEqQitAGedzr+GQVSWB6wY7EodWrhyla1Slr5xq6ndN4lenyUHy2Ux
 Z89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728996204; x=1729601004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWAWLMerFNg7ziMX/kkTq0c63ntBQBUxjKKx6kq8y/c=;
 b=FjFi5UhmIJGLitE2EwAqYGtRFIxcfYaLm6dijOOgH1iPWLLTpsvHJ9nG0nXJ+qUtfi
 042nKCmUaUQr+/+zbcl3Ki0Nxx+87ntR7oPwH5oE1kMIheT3Et42s5X5JDzJN/sXyMcT
 WTMauxQunWmz8dwU9fKfEd8ctUewCWFm/L7Hin9qyOeaMUgeIc71aZSb1hUGfJuxut4O
 U5I1r1+BL3ZglszBwPmS6jsIhICD8ZHAfopjngciWVXwD1jTwdovkQWUFixUodFnSqoz
 dDASFtXXYQV682ExBwVC3r3Zd/6+6BlwjRA43DP6bsmGkZ8pAQPOEbD8diMsXTCB/if6
 /m5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV32TA5ctmSoP8FHuNWYYzu5zN6Dbge6Wvk8zubQKr262m7fiyp5nJulqIJj6bJSEnrSOftEMWJNpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTigSl9hd4nGXwUMiojxEqAoVW1SRABbzOLgWYRXP9SKYekeIy
 rWMuPlGJcsaaEj63wWB2tLORrGjBp1Wy6IT/yIFYYsjTTS5dkEeb9Cjh0fpBmPg=
X-Google-Smtp-Source: AGHT+IFDKiJwxfvgxARv/QcbzKu7J6NoBQCUqpvWt3aC3NqNz5nV6x02/nbgYhrL2lnm8ld/sOFK6A==
X-Received: by 2002:a05:6512:158b:b0:539:fcba:cc65 with SMTP id
 2adb3069b0e04-53a03f19aadmr191156e87.17.1728996203869; 
 Tue, 15 Oct 2024 05:43:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539fffa8e3fsm161387e87.12.2024.10.15.05.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 05:43:23 -0700 (PDT)
Date: Tue, 15 Oct 2024 15:43:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: don't always activate merge_3d block
Message-ID: <3bh2bs5webxfwzuvj4io24cgpikgue5ukn4mthzlm4nqun54ge@quonfyry4soc>
References: <20241011-merge3d-fix-v2-1-2082470f573c@quicinc.com>
 <kah73euzauizsxvcrgmfsatshfe4pytgb7xe5iprtajg7abhsv@l7jdcxza5gd2>
 <0ca707a4-bd5f-4a31-a424-f466afa08e0d@quicinc.com>
 <pahfbstxa6snym7bem456npsp6bdekjqhnjcsrlpbfn77hkrut@uviaesubwz2a>
 <098b51a8-0165-4d14-9365-ef56ea2bcfae@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <098b51a8-0165-4d14-9365-ef56ea2bcfae@quicinc.com>
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

On Mon, Oct 14, 2024 at 01:23:24PM -0700, Jessica Zhang wrote:
> 
> 
> On 10/14/2024 12:13 AM, Dmitry Baryshkov wrote:
> > On Sun, Oct 13, 2024 at 07:37:20PM -0700, Abhinav Kumar wrote:
> > > Hi Dmitry
> > > 
> > > On 10/13/2024 5:20 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 11, 2024 at 10:25:13AM -0700, Jessica Zhang wrote:
> > > > > Only enable the merge_3d block for the video phys encoder when the 3d
> > > > > blend mode is not *_NONE since there is no need to activate the merge_3d
> > > > > block for cases where merge_3d is not needed.
> > > > > 
> > > > > Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
> > > > > Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Added more detailed commit message
> > > > > - Link to v1: https://lore.kernel.org/r/20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > LGTM now. Please clarify, is there any dependency between this patch and
> > > > [1]
> > > > 
> > > 
> > > No dependency as such. Both are tackling similar issues though. One for
> > > video mode and the other for writeback thats all. Namely:
> > > 
> > > 1) We should not be enabling merge_3d block if two LMs are not being used as
> > > that block needs to be enabled only to merge two streams. If its always
> > > enabled, its incorrect programming because as per the docs its mentioned "if
> > > required". Even if thats not causing issues, I would prefer not to enable it
> > > always due to the "if required" clause and also we dont need to enable a
> > > hardware sub-block unnecessarily.
> > > 
> > > 2) We should be flushing the merge_3d only if its active like Jessica wrote
> > > in the commit message of [1]. Otherwise, the flush bit will never be taken
> > > by hardware leading to the false timeout errors.
> > > 
> > > It has been sent as two patches as one is for video mode and the other for
> > > writeback and for writeback it includes both (1) and (2) together in the
> > > same patch.
> > 
> > I think it's better to handle (1) in a single patch (both for video and
> > WB) and (2) in another patch. This way it becomes more obvious that WB
> > had two different independent issues issues.
> 
> Hi Dmitry,
> 
> Just to clarify, the patches are already being split this way.

I had a different understanding of them, but after going through the
patches second time, you are right.

-- 
With best wishes
Dmitry
