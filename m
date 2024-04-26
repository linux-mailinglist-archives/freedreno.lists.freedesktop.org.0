Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AB28B3F8B
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 20:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A7F10E30A;
	Fri, 26 Apr 2024 18:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ejezo+5R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3DB10F083
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 18:44:38 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-de45dba15feso2951287276.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 11:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714157078; x=1714761878; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rPiNWGdfnN8JZJd8dsw7Vc72DKCvCwvtvuendszQLjc=;
 b=Ejezo+5RzP7Ogz4lqudiXmsX36Uw5QlHubR88yn3JJVmcW74PC3Oma5tXT4ND2MiYK
 2dEL4ScQw8A2Gtm/niAwnwj3x6eidlqNHJx9M5xXoYb2AZe+qN+0vbgd1IWMjCj+Z7QP
 /Wi93hqS8FtDVEiWsuapklDGyyLviXewN0NjZraTwkE90hLZptQOa9z/wl8jg1rrhP9D
 5jrozXkJBmxi0h2QCuTwt/at7MVYU/KotvHycvlR9QXT351PZ2CyNmP8FEJ4WzmaBNZc
 e+P/A66cy13Vkcks7ubMdVlcYI9y1vSCbiXgWQHIBuMfpVHSsM/xU10ZyzkDcQIQ8Mw5
 JmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714157078; x=1714761878;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPiNWGdfnN8JZJd8dsw7Vc72DKCvCwvtvuendszQLjc=;
 b=hDBVrOdHIkqIvtjzF6n2cIh4PUBlPCJrCeQNk52KWW8qLAiLLUGZ4psOM1HkYZgS/a
 FhpAqsqoiAsRYufgkai3Ek50e0DDkox4zeRhKyq4GxqKYqh1fnGABZSfu7aeI1kXIj4B
 1VN7EU/IpL/XgkNkhFu0wy6RjFQeECSpXc3BFj7Flbk4vSMNJqswSqFsQQ/8soOLOV6+
 xZcA3gHhgqWfWni7x7YxObubRQKnarsKjhsmzinjiet8YCgosbMYepWix9pSSXYPpS/D
 OJtn56J1KxNQ1Lz0poY6ThtvBUQkEm3r/3p5+9ceah2tXamYfpIA9AF3bH6rQZrqfCbk
 BnLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5xqMV+7DsbtGop8lLMNKVJOdDtLEgSFwhxCbP+0K/0ix6aguMnLT/Fpt1jxx72bu27MrmmxMXS+70Qwx3DvfciUv6LlT96NW3M/5Sov7O
X-Gm-Message-State: AOJu0YxgE9wYo96CFZJ6HVE8Eo+LQWT31MTFkLTEkRwtxcX2XKGauICf
 NcfXIVt9WN1XHd4eryGQgaLpMX+HeqOc9MxeVpHrims867z+X4H8z/F1vFZg2HWEAR3YmIPi4Y2
 TsJBAhlxlqa8tSnguN11HT1z5rOrjIKVpuIkaig==
X-Google-Smtp-Source: AGHT+IEBZPSkhTeyZCn1Cq2ot4W4tqIxgRzfLLkcqrRXEqEgcPk4vxhJsI6qrlPc7WoB0zQEQsEX8xqSosNMUxnn03U=
X-Received: by 2002:a05:6902:2010:b0:de5:5a39:2cad with SMTP id
 dh16-20020a056902201000b00de55a392cadmr4344715ybb.27.1714157077930; Fri, 26
 Apr 2024 11:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-5-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-5-562ac9866d63@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 21:44:27 +0300
Message-ID: <CAA8EJpq32gt1UJ078-O9K1LdH+8gmZGh-FaQDjmm2M-RO82TfQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] drm/msm: Add MSM_PARAM_RAYTRACING uapi
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org
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

On Fri, 26 Apr 2024 at 21:34, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> Expose the value of the software fuse to userspace.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
>  include/uapi/drm/msm_drm.h              | 1 +
>  2 files changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
