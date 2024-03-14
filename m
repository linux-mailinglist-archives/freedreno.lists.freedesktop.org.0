Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D087B5AF
	for <lists+freedreno@lfdr.de>; Thu, 14 Mar 2024 01:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3689510E68F;
	Thu, 14 Mar 2024 00:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BjqVXXFM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAC410E54C
 for <freedreno@lists.freedesktop.org>; Thu, 14 Mar 2024 00:04:50 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-609f060cbafso5420447b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 13 Mar 2024 17:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374689; x=1710979489; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rYpa9v/Uvcp+vP4bhmnZATlh/YoneUhRNbvkfQ+Gd6c=;
 b=BjqVXXFMM8ULHj68pvh4C8q9HVh444+9fONdaUfuRzOrR1VmgRv5wn5fs5rMdPOoGs
 21M4iMjtm3qNp6KLJoZ410n0PXQuftQKdY5frvWfna3S38I0xc9VCXW2AU6T2vLsEGcz
 q+ZJwzh5G2mzY/M8TmtqKwpbNh0LYe0zi4PjJQKPN/KnfbHhbLv2nvgrn3ZZxo4IJSoX
 D/T2q5+pa6rBgJC2X7DFODyqMZWIRCujy67CODTyBi5YNey/LbPvnO440hjolyIDihCg
 e8+cD6pjp4ha7oXGFIiJNtTTX+eszIjAJnDUVaj2nhxxFxxVmEp0t4P59TDBevjeVW+y
 6/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374689; x=1710979489;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rYpa9v/Uvcp+vP4bhmnZATlh/YoneUhRNbvkfQ+Gd6c=;
 b=Pi/XBOcfBlGPih6FBSEdZ1Ea1AmcbQ4m0e7qsR4YXdEnFJXLb9FWo6P1t0XxBzjq3W
 HN9tnv8fc/qg6kEeqzTRRFtox2gs7VxwuBKdqXg1Je5U+En8akRjKB059rIFzxgdu98W
 3wxIatUjoj2hgAWepu3d6YEm/gb86nu7jbKaNK+3B0RsBrNQDIGXKKUgsXSywa0i0vdj
 rKfkMSeQdV3+AasZ6tYy1u+Cj4Qr+cQV+C2C7aYGi5l9ijq7YEFBPh2SKCA7mhexnWEg
 nsx1iX+s3/H6UQSl+vwmbLQfdeH7S+nmEc0/AlBMEfZFkTQQlqFwbGupomVdWNbzZP8b
 QpTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVts+sCIE1hOI+N7SFl0f3sNc60qPh/RSQOkTMdoPVvHzL7+RxWHEbXtySCNdO5ZKuvPam7M/KunxXlys9qcgS6xxKUWfoFOYDZ1u7EkJ4R
X-Gm-Message-State: AOJu0YyY99V2IuFExMD40LQ92JF8F5v9aokgq5t5tUUmoulN20DKVWLm
 FALph1GZudVBnIS27HFEb1kE57ktKWP5E9DILjCbtg942EW6VhFuXyGmWbLby5DCKvb771/a7LN
 1nobuHPxR20x9ERrI/fscE6CbYJi0DKFzLbsLeQ==
X-Google-Smtp-Source: AGHT+IFgh160t5mc/VHtCKkq3crL5g/DfQmXNTqe7xSm5+kcqpj76uD36nWOSG4DWnAY5RxZbDwsXSC49FuQsA3G5EM=
X-Received: by 2002:a0d:d90e:0:b0:60c:753e:1e0 with SMTP id
 b14-20020a0dd90e000000b0060c753e01e0mr193025ywe.3.1710374689266; Wed, 13 Mar
 2024 17:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 02:04:37 +0200
Message-ID: <CAA8EJppoBY7Unq+LmPbQAvipU+HnJ0EmUkQdRBrp0=LezBAXvA@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] drm/msm/dpu: support virtual wide planes
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 14 Mar 2024 at 02:02, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> As promised in the basic wide planes support ([1]) here comes a series
> supporting 2*max_linewidth for all the planes.
>
> Note: Unlike v1 and v2 this series finally includes support for
> additional planes - having more planes than the number of SSPP blocks.
>
> Note: this iteration features handling of rotation and reflection of the
> wide plane. However rot90 is still not tested: it is enabled on sc7280
> and it only supports UBWC (tiled) framebuffers, it was quite low on my
> priority list.
>
> [1] https://patchwork.freedesktop.org/series/99909/

Forgot to mention dependencies, https://patchwork.freedesktop.org/series/130086/


-- 
With best wishes
Dmitry
