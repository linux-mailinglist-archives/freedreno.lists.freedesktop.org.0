Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD18004F7
	for <lists+freedreno@lfdr.de>; Fri,  1 Dec 2023 08:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647A310E808;
	Fri,  1 Dec 2023 07:45:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428A010E809
 for <freedreno@lists.freedesktop.org>; Fri,  1 Dec 2023 07:45:14 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-daf26d84100so223180276.3
 for <freedreno@lists.freedesktop.org>; Thu, 30 Nov 2023 23:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701416713; x=1702021513; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bAyzCXYFTtB/vr3pXCQx6aGmKFlokRzACie3Yxs1gkk=;
 b=CZZQHVw6aMt9wyIkm7z3ucPIB85gl+IbSMzWtnF8VXBcPzOSJGohNy8emhuGcN4DMU
 2Sfb2SrEgaSu9UfTCH87Id6QVfIetGNObRg500lve9kApc07wHh7Q95AB9Uh8unrqgcR
 Y5wmVqAq/l9buScTGsAqWxFsaibD3nAW9I5MaWH7P12DLIjcph2dcNFQIQwfzCOCZu+Z
 rYvjkxMdzQrHSk+XZ6Xg9yYcqF781cDdAwr5SJ+VnXri7veSA1W525imymqYDSeKnily
 uhKfORM0ImOoNUqrVdc79tKlrvBeIBzb3GGIRA2sBCYqkLu+kGSYwqNBor1sc/eYgoJ9
 IuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701416713; x=1702021513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bAyzCXYFTtB/vr3pXCQx6aGmKFlokRzACie3Yxs1gkk=;
 b=lkU6B7VNZ0BnsGRx7T/dErX2kM3OKSzKq1ytSVPgqhNibEWrC2qq1gup3Y9YxU0yY4
 srvtIF6S2nVA4UnFA9cNRXgVSIiB2KuXM3psKj/6tPE8D9oODejsUIgw8rpWkeWuVW4f
 9TZRAFa5hKJgCOIVAhU7v7EfeXkkjzsMZVHVBIrTBW8AJ2C5/DN3EMD47Sn76EAqStij
 o7OjCSV25wvut0AM4Dn44x6LFEDbatoiQRcIciJXBMgh0BfztJc7BU3AsaaT8q1wRwEz
 +7ywMiQ3DimvkWIhpJsxmT4/uN1Pras+edQ6xgQQtERpKiF3vs8MJd4QJk73jxAaMRjJ
 VR5w==
X-Gm-Message-State: AOJu0YycA839RYrePolIWvCoQQBRag/R5oxIvWM94t99PatUfK6E8J9H
 f+Ejl9Vxwb5yzBYzXQ9MVSdwVZ6MN+yK+hX+yX3zNw==
X-Google-Smtp-Source: AGHT+IFS4C7LCzDwL4Hj38KGzIxRLCyE0RQvsnn0ZgHweV0zxG/M0rJEcXuB5HAkf+D7lbK/o5D4Z747vtaw3IpSu0M=
X-Received: by 2002:a25:f44d:0:b0:d9a:e397:3b4 with SMTP id
 p13-20020a25f44d000000b00d9ae39703b4mr22927544ybe.46.1701416713218; Thu, 30
 Nov 2023 23:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-2-quic_parellan@quicinc.com>
In-Reply-To: <20231201014101.15802-2-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:45:02 +0200
Message-ID: <CAA8EJpqGx3eQ3o6bJhv3OBmHqtp67x8ODupZgKfSLSfFcRRmHQ@mail.gmail.com>
To: Paloma Arellano <quic_parellan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 1/2] drm/msm/dpu: Modify vblank_refcount
 if error in callback
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, steev@kali.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 1 Dec 2023 at 03:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> When the irq callback returns a value other than zero,
> modify vblank_refcount by performing the inverse
> operation of its corresponding if-else condition.

I think it might be better to follow Bjorn's suggestion: once we have
the lock, we don't need atomics at all.
Then you rearrange the code to set the new value after getting return
code from dpu_core_irq_register_callback() /
dpu_core_irq_unregister_callback().

>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 9 +++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)

-- 
With best wishes
Dmitry
