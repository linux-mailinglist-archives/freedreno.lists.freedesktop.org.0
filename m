Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFDDA3C615
	for <lists+freedreno@lfdr.de>; Wed, 19 Feb 2025 18:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA4110E112;
	Wed, 19 Feb 2025 17:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RHNmOecF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F12810E112
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 17:24:26 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6f754678c29so61807857b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 09:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739985865; x=1740590665; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0cr90zEajdAaEBjcRfisPPDqVdNWUpvTZCFRKVO9Uh4=;
 b=RHNmOecFP6Gkzig9bO8eLaOJnvFbm+KbSbgV4oLyOkO1rntFLbDxIFx31G8IIs7lGE
 tsyno61vQyGhRvYfzkUUtzAhFjQLXQA0nQsFO7XQFn2C0lYUhtCAnn6PTHF31shzRDg2
 UsmDCU7B27Zgl9CTCYJG4l06yH4hUlBJrPk7AT+pdMKkhPYDKjtnroPWMegDKhldIUTI
 qRsM7e9Oe1oeAlu0QVJekmMqCBYgzW4egUXdZZ8TTQ1aat30BGJdN4e3EtJ/EoS3GqUs
 Ss9yff5JC/kh/VWkGZJkswhYD1e2P7ievJAqlYhKds33qO5MksvcDeG/L9FSbLY9UT75
 AluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739985865; x=1740590665;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0cr90zEajdAaEBjcRfisPPDqVdNWUpvTZCFRKVO9Uh4=;
 b=M57RhJV51KfKrHtHBSF03U0FLo+erVKeWRP5wfhCz77KN51k6TuRBVE/yphAefeZBW
 MGByCnTLuD2NjrnQwDkjXFnGxwdB1vHISTkbFlT31A+Wd6UFXJmHNQ4EcGVUijei8plR
 9pGBmfl62IkGB0ovCxakZZi6SD82sfc6VbIpOaMXt6vlG2x+nIcdb+gLZ1/v553DTfo1
 GSFfQuHKke2AUJO7oNYar7yjP/vMAFPG+uyoitIjcY1/GzY5L3celsJLh3gZJNJNnjqL
 AyGZN2+/wPvUtmLGsskThN7/2AsAismwXcZvgiLR5GV4QGulErDV8i5ilz05TAxj0zEg
 sJYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrFqE6DrDZ8yD/n6kU9HxjBpDciJIwRphHfk+A41yO85BI5LSWnzWyFdMfiYEB6G9qiQmDsOhFHkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxWbxdgUdLN5w2qH9SGQSxUP8v+sEiY36JtI5KDq+fFgTkZEk0
 KcOAoTEzuFYrGg7lkVK6d0Tkc+QF2ngGOBDD0gOnI2numZWc4G7ZHj5ksjQvoOK4RmRYuSvFJXr
 B2zpZuR+SNfjrA2Kmj25LNk2ZWVjnk0XoWpCrzw==
X-Gm-Gg: ASbGncu4UB+caNrE6Y3hr/EQFOvy8ampLBGVETlALB3S26HlFUWyQ7SFEEf1+eo3uR7
 DM6VO/W89IdrPOaEyW+QiPr9lq3T/tuQ1boKTK4mqsC0Sozqmzwe6BPg/W/2TSeDGdvA8zeAAGL
 QAw2UYV7lP/tg=
X-Google-Smtp-Source: AGHT+IHPYcZfjn7eucK8FvixqCR2I2msLnTZntlahztuzdBpXoxW57EO45la9a3FzKXUns8U3FOZ+w7YFPg8lisWjjs=
X-Received: by 2002:a05:690c:7445:b0:6ef:7dde:bdef with SMTP id
 00721157ae682-6fb58359ca6mr143804167b3.23.1739985865461; Wed, 19 Feb 2025
 09:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
 <qlotuliwnm5spneolztca7avmh2a46pz2xqlxzqbw5kwa53m6q@oyhnzz7fhay3>
 <4b2426d2-a7bb-4c19-9ebe-77f6a90caf5e@linaro.org>
In-Reply-To: <4b2426d2-a7bb-4c19-9ebe-77f6a90caf5e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Feb 2025 19:24:14 +0200
X-Gm-Features: AWEUYZmAr3QYLaFayeHeppxyHSH1mnwXmz4zOX0FGc46bc3FPvsfNyKPQb2_VV4
Message-ID: <CAA8EJpquBhQeac0E66NqeagkxP-qY0whmah2ND0xziUQdxc_7g@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] drm/msm/dpu: Implement new v12.0 DPU differences
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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

On Wed, 19 Feb 2025 at 19:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/02/2025 20:18, Dmitry Baryshkov wrote:
> > On Mon, Feb 17, 2025 at 05:41:36PM +0100, Krzysztof Kozlowski wrote:
> >> Implement new features and differences coming in v12.0 of DPU present on
> >> Qualcomm SM8750 SoC:
> >> 1. 10-bit color alpha.
> >> 2. New CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers for pipes and
> >>    layer mixers.
> >> 2. Several differences in LM registers (also changed offsets) for LM
> >>    crossbar hardware changes.
> >
> > I'd really prefer for this patch to be split into a logical chunks
> > rather than "everything for 12.x"
> everything 12.x is still logical chunk. I can split more, but without
> guidance what is here logical chunk, will be tricky.
>
> For example 10-bit color alpha looks like separate feature. But
> remaining PIPE/LAYER active - not sure.
>
> I can split them but I would not call such split necessarily logical.

I'd say, the following items are logical chunks:
- ctl->ops.active_fetch_pipes in dpu_encoder_helper_reset_mixers() and
dpu_hw_ctl_reset_intf_cfg_v1() (with a proper Fixes tag?)
- 10-bit alpha, border color,
- active_pipes
- blend stage in LM + set_active_lms

-- 
With best wishes
Dmitry
