Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9D9DE79C
	for <lists+freedreno@lfdr.de>; Fri, 29 Nov 2024 14:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC9A10EE21;
	Fri, 29 Nov 2024 13:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dWL18wr5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2162B10EE16
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 13:32:48 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e396cff6d36so1549297276.3
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 05:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732887167; x=1733491967; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4rk8EqcQBJedHgZVFcqE3LAsuROmL1X9WJEUhmB7OiE=;
 b=dWL18wr5hfLjfi8E0ObbGp9nq0eCZs6KwcqtxSg3Y14mkB3yXlb71wKyIKMle6Bz9Q
 gs9HEnKj1LCcatFGHwB2Y4NSdYLnJkOZ34bzxRBLam6SZqVntkDTBoiotDqQPZzjdVva
 QuiKz6WwpeDdTkSW4y8g7jZ4Ubqju1PJ1OigPnVBGPlObGzVFDBeyCj3rSaNCqtr/PH4
 I6r3mRgepHqWTaJ56IgDnqungn6BKmLdxkIVUHrBsRjIcFeflvJT1Xbwzgc/VMWlpn6I
 DDv7JTt9I/OI/4sIhI1tG2VMrWNEis1vJAY8ch1Fke6JtB8dAxsnzOcn0K6ihpVgvuzN
 3g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732887167; x=1733491967;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4rk8EqcQBJedHgZVFcqE3LAsuROmL1X9WJEUhmB7OiE=;
 b=AV0vh5tFy8CHtiuFTALo+hb81arwOMo8ngWk5exxjl4zVbH4yJYRxryHexrWNvqAg0
 83JXpAhnni9rbfN+6T4OnVxzSr7VBg4alDbVi3RqYwIp0GNznk8bmGOOAcMHiMWXHKsO
 QfLAR9gCnjw1HtX0moH+13M/lUo7xP5yOJRlaf+gP8ZIYV1TpvEP0BhpN7lFq4T4Qvjg
 A0IsvNXvNrdaR4TkGVoHbfiw/FtssvULezNaFCLd8ROGic0bTmwHnWADt5IerrtMlKcv
 ZQEvbXwWeUG8cr+tl709UGMDVNQHCgUhF9Qj7Y+PewavJ7A83lpwey6kl7e0aESuECSw
 CnqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF52uLgVqoBWopPGRgVshPakCQ+CmP7rFoNtwY+6YskvQNuj4r7Y3EicKUiMaDL4ozYIhlUBVjRj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtyrtmuqnfG5Fedl/I3bpSunlKCSLcSnjqG1tSYYxW4teBpBIz
 yYrR13WYISkMNEtisGgB6buUG25GmtaLOMEkqIJl5BS+k9Fc4W03SMQQ1eHpnUPSmwyGda33xaa
 7Y+4LFnIWt0f9Hb6eTLU+fOeoI/vhYh5uLSSeKQ==
X-Gm-Gg: ASbGncvbCSXitM9PFXV/WNgyaHhZv126J0wWwWUcJJ9NYA8GksvPJsDoxe+sHmbrxSD
 8URVOPrj/iLuMIHt5NAnFlJS3TKbVJwo=
X-Google-Smtp-Source: AGHT+IHfjxXnTdn0iSp1AqYYDcm5/K9nEAphNu1TQKr2ozphQmTsKuv3nB1lPh4zZEbpx4kmGb4PSCSBKcPFfDN6tJ4=
X-Received: by 2002:a05:6902:1504:b0:e28:e407:610 with SMTP id
 3f1490d57ef6-e395b957479mr11164613276.47.1732887166767; Fri, 29 Nov 2024
 05:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-4-29b2c3ee95b8@quicinc.com>
 <f5kqdxkhniwwxu6wm2q323vvlsfn3yyig7mfg3h5ctqo7jjxc7@7g32tirseuqs>
 <9821c4d5-8d1d-4bed-b3e0-879d0aeba017@quicinc.com>
In-Reply-To: <9821c4d5-8d1d-4bed-b3e0-879d0aeba017@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:32:41 +0200
Message-ID: <CAA8EJppDomrYvtJ46pi1_hDsf3zFeeTfrkQfVwE8UTN01KfKpw@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add QCS8300 support
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Fri, 29 Nov 2024 at 12:01, Yongxing Mou <quic_yongmou@quicinc.com> wrote:
>
>
>
> On 2024/11/27 21:49, Dmitry Baryshkov wrote:
> > On Wed, Nov 27, 2024 at 03:05:04PM +0800, Yongxing Mou wrote:
> >> Add definitions for the display hardware used on the
> >> Qualcomm QCS8300 platform.
> >>
> >> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> >> ---
> >>   .../drm/msm/disp/dpu1/catalog/dpu_8_4_qcs8300.h    | 485 +++++++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >>   4 files changed, 488 insertions(+)
> >>
> >>
> >
> > NAK, there is no need for this.
> Got it,thanks. will modify it in next patchset.Compared to sa8775p, they
> use same dpu but qcs8300 has one less intf and two fewer dp intfs. Other
> configurations are the same.can we reuse it or a new catalog file to
> show it.

Is it actually not populated in the silicon? What happens if one
access those INTF_n registers?

-- 
With best wishes
Dmitry
