Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF44D815D09
	for <lists+freedreno@lfdr.de>; Sun, 17 Dec 2023 02:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A5710E109;
	Sun, 17 Dec 2023 01:33:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3016F10E109
 for <freedreno@lists.freedesktop.org>; Sun, 17 Dec 2023 01:33:52 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2cc3facf0c0so18215351fa.0
 for <freedreno@lists.freedesktop.org>; Sat, 16 Dec 2023 17:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702776770; x=1703381570;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=hl782NtFmKPulrM6nPcx+9M9EkIbH3sXgzxwfUjhxxY=;
 b=N3D6HUc8SEHHzyrj+S/3lIpFQjnrYoPR+Mm0MmEfF5STFRyDsAA2AC8QIxXsxpEiU8
 FB/LV/PSgl13rBBEzEzy1kcPcfLDGeAeN+uwm2N7Mk/TtDrUCdRAxB11BoBmFxuN1mHt
 a6c4USozsT31YLfouUfFUmXGok+XCUY2ro4sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702776770; x=1703381570;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hl782NtFmKPulrM6nPcx+9M9EkIbH3sXgzxwfUjhxxY=;
 b=W48uiKv6f2DsYSMkYrhZKfi04mmRKKgppKrk5vuQiC3xFFlz7YEEcWugv1zS4+qB9u
 nqdwJ13L/SFzHEeMEE24IO8gv6UW/c9qyjPWyeYmAfMc+VEdJC8VR97iOguhcqP8Xkrm
 13yEV+z+KcLVdqmOvFGHfmxf6v5WKPPYOy007Pqd7rTkF150zWfFbaH+FcQJaA1I4a7n
 prTmW9pvfIuhM2oLC4p9/POK/ruBJm0YyGVqMtMhav0ej5lNpHXZOmZTtv/FDcNyslXH
 Kl5uijyAKBpyCyXWfbM8NWjlODQWcSQwbGAbcLh0vNaGtjdzlwGYyvVsqdPw2btR1IjD
 y1Pw==
X-Gm-Message-State: AOJu0Yxwpe2lOKyCj/f7aW4EMHGJxFzW1PxAG2zGKjUbGA+GYPfrOBAI
 g4WI4A3sv4o4+B47VLbq/iKIVS6M26RBtTpaDXdd5je08AFeTmGT
X-Google-Smtp-Source: AGHT+IGI/qIxJ+tAk/PNQNrLNhT7HuVcrrKpVt70q44XRpAb37rhW3MUD7pq1ZTc5wUOEpLk5A4wOU9udQLAHzJod+c=
X-Received: by 2002:a05:6512:b95:b0:50c:2177:f184 with SMTP id
 b21-20020a0565120b9500b0050c2177f184mr9901201lfv.17.1702775095723; Sat, 16
 Dec 2023 17:04:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 Dec 2023 01:04:55 +0000
MIME-Version: 1.0
In-Reply-To: <20231217000158.912062-1-dmitry.baryshkov@linaro.org>
References: <20231217000158.912062-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sun, 17 Dec 2023 01:04:55 +0000
Message-ID: <CAE-0n52PqzgUJjvFZdURKvFCN9imR-bGxqadtphwkBf5XKJZDA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop obsolete documentation for
 dpu_encoder_virt
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-12-16 16:01:58)
> Drop obsolete kerneldoc for several fields in struct dpu_encoder_virt
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312170641.5exlvQQx-lkp@intel.com/
> Fixes: 62d35629da80 ("drm/msm/dpu: move encoder status to standard encoder debugfs dir")
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
