Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CC38503D1
	for <lists+freedreno@lfdr.de>; Sat, 10 Feb 2024 11:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A2A11269E;
	Sat, 10 Feb 2024 10:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zvXOmDhc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CB71126A2
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 10:15:52 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc755afdecfso1306724276.2
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 02:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707560152; x=1708164952; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nTueEFOakGyv2InDAGvYZKbL+VubaYqrJvCf8EJK9lE=;
 b=zvXOmDhcUCNBDJHNK1d1AcQU8/layoQ3XBKt7owpmokZZIcycsXzdi9wiOZv9QK52Q
 14ZQYxNatyg2wEIb60N5+ZEVEJasg3FOLw2R1oUt9/8hE4K1Fq3F8oeuf+5GhtlcjqA0
 LoCEN2036kjMyhgFeO0eTUC/hHf+DWovzLzJ3NlPByvfwQCYVuon+PsyGuoYnKpq8zP5
 DdzD8E7icJpQb4VJsxPm5S+gXyJkxKSdgiP3gpxsyEIiyBbHm7D1wg6ozUt6EDpALRG8
 dFwfGbrAEY9h+3os0TqfzbVwQt0ZL5fTlm8K29VQgHfzH8PY0U41lhpT7mxd4TqQxGT7
 4c9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707560152; x=1708164952;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nTueEFOakGyv2InDAGvYZKbL+VubaYqrJvCf8EJK9lE=;
 b=UrBwdB0ROy0C6sa5fBU/BvJeT/qOCa/ToTDowAYMSGh+jb6fQOH5Wo4a3eYSTTgji4
 K0Mi4qd5DjpKHKV6ZQ5kZnOT42XomJpJMjGOCPGkh0QSt/Tj+Rn9ANCMcIvpFEjM3APY
 q989afszp8zBquqCKgEtD8cr0azXbPmN23Ukp7loM9qr2eKzE306hYkC2OqBUEFQlUmb
 k9S1tNOLj3k3NnUMjNNlMuml2WfijnzFygQ0f6Xzv/YpSDiVK47GLEKx2Y+erb6S52ib
 wlEY971Nnmd7dEkTfApAdgRK9iuZjBrFLbsj9HQlXHJSiLWcjStnAVrEadZKI/Wj2wwU
 pBVg==
X-Gm-Message-State: AOJu0YwRK3WTwZCb3LP+irsuX8+p1+TifVN7uNzIEWdHuPtgBmHFOKDz
 S6aMuyF1pJ6/+tiOMetTDkUzEkrFxnantYt2v4baWg/7Mt2PADPoCTx7iCUYYKjO/loNfyin+gV
 Wm+VymSX+kYA//IWR7POrspG5JWTI/ZLCUh9n8g==
X-Google-Smtp-Source: AGHT+IH3pyRrF+bOTqZSKxC6d1uuPmJw/Ln+Vm5zM36cx+v+NuNLqQtQuSRqJnbCNZnhzilvIHKApUIQFwXeMRFi5qI=
X-Received: by 2002:a25:d08f:0:b0:dc6:48fc:65e4 with SMTP id
 h137-20020a25d08f000000b00dc648fc65e4mr1465961ybg.40.1707560151817; Sat, 10
 Feb 2024 02:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-15-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-15-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 12:15:41 +0200
Message-ID: <CAA8EJpq0GqJapkLMuGSK7CqJ5mAJJJPf0MQWER9Mb6ErHmXrog@mail.gmail.com>
Subject: Re: [PATCH v2 14/19] drm/msm/dpu: add support of new peripheral flush
 mechanism
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 marijn.suijten@somainline.org, neil.armstrong@linaro.org
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

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
> Introduce a peripheral flushing mechanism to decouple peripheral
> metadata flushing from timing engine related flush.
>
> Changes in v2:
>         - Fixed some misalignment issues
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 10 ++++++++++
>  2 files changed, 27 insertions(+)


-- 
With best wishes
Dmitry
