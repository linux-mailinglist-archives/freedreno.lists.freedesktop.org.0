Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BB76C8801
	for <lists+freedreno@lfdr.de>; Fri, 24 Mar 2023 23:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B90B10ECB4;
	Fri, 24 Mar 2023 22:04:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E20110ECAD
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 22:04:25 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id k17so3968630ybm.11
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 15:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679695464;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kaR8KoYOCyBpa3wXhO1e69P/3ERCtiHXhKvCkKv6lXM=;
 b=dr4L4d0WroGEG20/Bi+jk8wcIAbHjq36FQoGokCOOOUiXou4/rLD630Fa7NkGfiNHM
 F8aMEsCImFl07V1c1jf32cNJnvPiYG8wxgp84ZvL0plICJY8a+0D+eMRMiiQ7qPLMYZG
 8OvLaVnZWVPlHDhe/RMyvMMnTIkOwmxjotskiL1e7IoWSnitaQPJ3CXt1+cjoa83eB51
 RQxZT0MwiMFJPIvSY9Fq5uygOeLurQoYncUXyKo8GPrftd5C+0vfotJiuvLXEzeIaM2j
 wM5O4Or/bHXwjiczKLAIiYgu/VmwSAaP8xG/W5VqwN+trJ7XFJuaUg1V8dvGXLsnAr+E
 nvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679695464;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kaR8KoYOCyBpa3wXhO1e69P/3ERCtiHXhKvCkKv6lXM=;
 b=tH9CUWpVTcxTe3INbHJme/bmWZmWuOWto1AHxYTB0m43rEE0W3zFZ5B3g61phpkBuz
 IUyP+sCNO8pKs8C8MZu8u8A2GawWmkjfDFSQRHQCrybKRWwu2sPuYAc6pTTRmkaq56mK
 UDcB4tJ/2iDBH9gv8zCSejg8DCMaTNV8Ze7yDgprIfl0UX8Dt06SKtfz47rXccAh8rwh
 SaDxOWv/TX/wXENdS/e48rvWyAaIVpCg2dJNa7mTn7vq00J51mmkJd1BQKsSfj+nE063
 CL6d6nYvDjJH8nHLp+skdwTFba8BlPTPXwPOsIK/4MYYRyCfv5jvFkVOUhhjU8pdMq/u
 tIug==
X-Gm-Message-State: AAQBX9erU1HNXde61WYmEuWu4jpzNfdkRx4YecoGplzGrPWoON8wLp/C
 RDx8PUTeH5CDCteweJHh14i2jrpoO7BMSsJfFC1aeQ==
X-Google-Smtp-Source: AKy350Z4IyKzgCSsB9drN4aQZFXjzTnQ/z2hXzQ2JIAVjbZ9YcgBNEvzHIbBigw+DnHvLOMD13d24aAC6uV8Bn+RLdY=
X-Received: by 2002:a05:6902:168d:b0:b6c:2d28:b3e7 with SMTP id
 bx13-20020a056902168d00b00b6c2d28b3e7mr2295587ybb.9.1679695464535; Fri, 24
 Mar 2023 15:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-6-johan+linaro@kernel.org>
 <90264695-131e-46b7-46db-822b0aee9801@linaro.org>
 <ZBqypsYBMSr8HPxP@hovoldconsulting.com>
In-Reply-To: <ZBqypsYBMSr8HPxP@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Mar 2023 00:04:12 +0200
Message-ID: <CAA8EJprjkTdNT5P2_PTA-3wJqnQTgiwgOLWmrwCH0B94SZdvdw@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 05/10] drm/msm: fix drm device leak on bind
 errors
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 stable@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 22 Mar 2023 at 09:46, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Mar 21, 2023 at 04:54:51PM +0200, Dmitry Baryshkov wrote:
> > On 06/03/2023 12:07, Johan Hovold wrote:
> > > Make sure to free the DRM device also in case of early errors during
> > > bind().
> > >
> > > Fixes: 2027e5b3413d ("drm/msm: Initialize MDSS irq domain at probe time")
> > > Cc: stable@vger.kernel.org      # 5.17
> > > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >
> > Can we migrate to devm_drm_dev_alloc instead() ? Will it make code
> > simpler and/or easier to handle?
>
> I'm just fixing the bugs here. Cleanups/rework like that can be done on
> top but should not be backported as it risks introducing new issues.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
