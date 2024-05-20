Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F77A8CA073
	for <lists+freedreno@lfdr.de>; Mon, 20 May 2024 18:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E4910E264;
	Mon, 20 May 2024 16:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kkL2bKW9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EB710E264
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2024 16:08:17 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-69b4e94ecd2so7304406d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2024 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716221294; x=1716826094;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/kGm8BVTegBDF6ZtCbDHbkok7PhmOjbef+2E72+mzc=;
 b=kkL2bKW9kQnSr1vQ32zgwv4DLCxAuPe8FchMnAWOLXfyYjF3/6LE7EEPEBH5bmr9Nr
 HjvX/G9b0nykeiw8itt0f1/3kYw7xrQWHxjfWHDU96dZ9I0khcfK8n3sTx+oB7zoq3FN
 ph8Fc0cVN1jBz5LCtngm7bdXuzInSCuJuBcno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716221294; x=1716826094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/kGm8BVTegBDF6ZtCbDHbkok7PhmOjbef+2E72+mzc=;
 b=kgagRpT+IFdGbKcQpn+FcGPx5/QwM4JFbm46x2bSMu+5iauxVzAwS8Pifbi6LnYNgy
 YN28NwqCgtFpkztl6tUmz7yGEN1BULnZibE7cjO4O3v/h/CYue7oU+6gbVWxrR7NFIHq
 1pS/F/lc+1fp7MrIgjrLUNPy2v9xIYK6qSwShx2rHNYpgte6dp4dd7JNSdEg6uMA1t/N
 lS5KhZ10R1u+qBUaGlMSyU2fArH/FOp+6I7OBSKwDQCCJM2P3hdScs0UypZ2LhcDk/0O
 LM57Z5IoETIXTygswtkSoDFXZ8XwGviDPCIYYuMVTtkyEhS4tG1x4VoIi0lLuY7ch50s
 5upg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULsP/WSMT/tf72O3hhuz97qvTWzgz5qgXEtxMYsQ/jmPDf/CcrfhKC77qHkVcD0zYcyqIuOVd49CLxNf/cfPtYFnVmwdNns6W9uuk15+YP
X-Gm-Message-State: AOJu0YzljoIoex7qBY8DskSiG2+VKK1ze7cvNdJCSK0u9YuZR7nuDo3G
 9dRUk1+31Z/qkSpGcjNU1PrsTgQzLbBuUuQhveWc56MaxGy+cri/vHwRrQp7MiRIcDGYU2HASIw
 =
X-Google-Smtp-Source: AGHT+IH7KNlrPuDmx/+ELI8rEAmcOAf7tUyAxwdF7+Ua/++DPcYxJGKakPaMBnTMYn5oqV+o78zRRA==
X-Received: by 2002:a05:6214:598a:b0:6ab:631d:3267 with SMTP id
 6a1803df08f44-6ab632c7584mr22413436d6.20.1716221294567; 
 Mon, 20 May 2024 09:08:14 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f194c88sm113219546d6.65.2024.05.20.09.08.13
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 09:08:14 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-43dfe020675so668231cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2024 09:08:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV8IUBeAUK1b631j8VLsNKKEkiDlDLhY+qoJ5jO5suPFecvzEv6lD3LrM9/Z4A/h0FOFXauPNN5cpBAH7kM0/NUYqBkfjbpHrHvZIDyenZZ
X-Received: by 2002:a05:622a:820d:b0:43f:7b35:c5e2 with SMTP id
 d75a77b69052e-43f7b35ca1dmr3103541cf.16.1716221292824; Mon, 20 May 2024
 09:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715691257.git.jani.nikula@intel.com>
 <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
 <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
In-Reply-To: <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 May 2024 09:07:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgpD_JqxpVezZ=RzudwxLJb+gN3Br8U03ONLGv9n_JmQ@mail.gmail.com>
Message-ID: <CAD=FV=XgpD_JqxpVezZ=RzudwxLJb+gN3Br8U03ONLGv9n_JmQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Sun, May 19, 2024 at 2:01=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
> > Prefer the struct drm_edid based functions for reading the EDID and
> > updating the connector.
> >
> > Simplify the flow by updating the EDID property when the EDID is read
> > instead of at .get_modes.
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > ---
>
> The patch looks good to me, I'd like to hear an opinion from Doug (added
> to CC).
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> What is the merge strategy for the series? Do you plan to pick up all
> the patches to drm-misc or should we pick up individual patches into
> driver trees?

I'm not sure I have too much to add here aside from what you guys have
already talked about. I'm OK with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
