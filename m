Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC92C80A247
	for <lists+freedreno@lfdr.de>; Fri,  8 Dec 2023 12:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BE910EA75;
	Fri,  8 Dec 2023 11:34:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341BE10EA88
 for <freedreno@lists.freedesktop.org>; Fri,  8 Dec 2023 11:34:29 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5d3c7ef7b31so19031907b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Dec 2023 03:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702035268; x=1702640068; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ioy7a4mjD1TM5aUtdQWmEC4pgXl3wwexCFdK6aCY8Cc=;
 b=mEwXk+FHwoWzC8UbzpboYq1So4Pk7XO4tESVKfBYtHC0DQJfN0VE8IpYG+MZ3Y/Go+
 +r81xBHmKYIEAd63ywnyTCd4Op0eKvkz2K5Xrwi3h+aB3ujpVNHzyf+tMHqGBwjjdsRM
 x/24KPdZxpp49eHkZagxO0BlDEMkArIp1nafq5vaWJKB2YXain1/3d9lNKZfV0wPkcVM
 praSGTkwolRorLc+E4U+J4PhWGAEhtROponWVHfWFzuxjM6qoZyYfliw1IfEdvUzIiLv
 TM4nAfaZPK6TTv/jInPLy3y57PZ994vYud93dVnG9bE96xKVZh8EAwaxc/7PRCC+gwCZ
 hqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035268; x=1702640068;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ioy7a4mjD1TM5aUtdQWmEC4pgXl3wwexCFdK6aCY8Cc=;
 b=N67+F2fWqLu8C1JVHUBksIkuKeQ1B5h4BV7lvG0nJLaEbchRAuca8wusRQxE3+6iMJ
 BU9yuVRg5yWZpHM9QjBmSPkVZIMpWtBYczcAI9gPbFHs3LFllziRyYNTRft+9uudmsWk
 VxN4K09Rqsjt1DWKIUqpFzz9sokaOf1ZQrANjCpLctLKSDQWGm8kbnJLd8L92BaJtHyW
 vmsGU5i+5BVlvEVSmxOlU0pmZO7lnKiHU2JuHIvBj14VyRiQh3OL+qzpKL0gP2Ya+QPi
 Mi4roP+/kidHXzeGUqgtwM5eVSc/r1/go90w5byoRzHtLOVVOVJD0wpWFZ/dipTbl+dE
 7Z1w==
X-Gm-Message-State: AOJu0YzGEQs1kMcUMdC64+vzFz4rkpg9LqVDwGL8vrqOcSoqmyT4LQAg
 qXay1wc4k5KP2pIkybngzKR8nBmlM8hs0NxSs9u6zg==
X-Google-Smtp-Source: AGHT+IEnxfoJSBiNek6sdMc7Ud4skvctpIP2+cEf8vddxE69b7AorZ3VH3y8fLa2ZwsZWhID77sUwyYka6dZEElUZlU=
X-Received: by 2002:a0d:cbc4:0:b0:5de:955e:24a6 with SMTP id
 n187-20020a0dcbc4000000b005de955e24a6mr639733ywd.2.1702035268406; Fri, 08 Dec
 2023 03:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-11-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-11-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:34:17 +0200
Message-ID: <CAA8EJpowcKmn_xXbmwXZGiTJXuwJcArjyDii7m1WjofPE_xoxA@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] drm/msm/dpu: add CDM related logic to dpu_hw_ctl
 layer
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, quic_parellan@quicinc.com,
 Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> CDM block will need its own logic to program the flush and active
> bits in the dpu_hw_ctl layer.
>
> Make necessary changes in dpu_hw_ctl to support CDM programming.
>
> changes in v2:
>         - remove unused empty line
>         - pass in cdm_num to update_pending_flush_cdm()
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 35 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 12 ++++++++
>  2 files changed, 47 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
