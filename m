Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E3783E354
	for <lists+freedreno@lfdr.de>; Fri, 26 Jan 2024 21:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9AB10FE4F;
	Fri, 26 Jan 2024 20:24:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FBB10FE51
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jan 2024 20:24:54 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-5ff847429d4so12734297b3.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jan 2024 12:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706300634; x=1706905434; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDpAa3J0tQehwA7Ry5x3tOdmo/d5D+jLymbO2mRHCxM=;
 b=vh+VNkPiey3Myz3Ee4kulMgNC70k8Ue0ZklilkswhWpS5eBGpSICRHKSecNnEz/uf6
 XSt8/1vkRFB5socT6kJ+n8nOEUFT2dk28gKR/mU3qLQUqWIyIBeUAkFh/tsB5vZYD9qw
 HVlKd0GzKHSy86qGVRcGW+JEghK+sSCfhx9rQGJycDGJj2BITUlvUew7ESIJIock/3Dw
 XiD3QLjvMd4NnzhzKkxnO5t4UnS0WCU3IK+1VKNP7tGyIPThMs5dhRp+vS2fVeiM8c3E
 7lm3rK/F1AAvw19e6+tzgeGcSuy4N5BnNAlkOjria3/UZ9VHOG6smpm5jYXvHAnrIVY9
 fCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706300634; x=1706905434;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZDpAa3J0tQehwA7Ry5x3tOdmo/d5D+jLymbO2mRHCxM=;
 b=anbVlomp5jUe1RdruDxuZ+W1Z6RWc72zhZ0SCebBwP8UmAwEImnucflJ9dAOEprnlw
 8UIXdex6oD+bPqEFAQ5KmzlXYtuVUg6ywUXzF1Lkyszwi+IUioplEwP4Kc7Eav16/nl3
 w745M8DHfEELYfeCbcNumLhcmRpzbDeIn8k9u2GNY3E9jvOk99S/0KnBaOHyZ2Jm0b0u
 470KtlI+Uc/4nfhkn8yU5iCMSpl7zJ1+XBiSTgQStG0piU9O2fjQZ2CJej32zeeo/XuB
 /2YTVaX60j+BZtDyEYRWGeNk5nVtnEG/ipFkckpZXPo72BYFn/NC08YQDC/AMr3pmhII
 RvYQ==
X-Gm-Message-State: AOJu0YyK9R+c+a84/hyrh91QJcMh13Gw1hcK/CDb7z/yvFy6Kr9lkzs1
 aEBw/oefTPc5nDGtgg8ficX94JdxwshGq7Y5Am8N3VgrhM862dM5JCpTB5rB7svJYBvgxLGYua2
 s0f1P8HcWAmh/lmpoPNrf8CxKo0ATChfZsEuP/A==
X-Google-Smtp-Source: AGHT+IFPF1qh1U967GMR4IMG8c2YBW/cJng//YXeuLBPB86SGHhjM8CdAyJiEtMQUeyEpXkZzGmpDP4rnUUw9ZtJD9I=
X-Received: by 2002:a05:690c:3603:b0:602:ce8b:6aec with SMTP id
 ft3-20020a05690c360300b00602ce8b6aecmr735792ywb.51.1706300633869; Fri, 26 Jan
 2024 12:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 22:23:42 +0200
Message-ID: <CAA8EJpoNuWaJTGs7MfHCQ+OE69HT+NZ1kjEw0ZJtvhZyS778zg@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 00/15] drm/msm/dp: clear power and parser
 submodules away
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Stephen Boyd <swboyd@chromium.org>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 26 Jan 2024 at 20:26, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Reshuffle code in the DP driver, cleaning up clocks and DT parsing and
> dropping the dp_power and dp_parser submodules.
>
> Initially I started by looking onto stream_pixel clock handling only to
> find several wrapping layers around a single clocks. After inlining
> and/or dropping them (and thus dp_power submodule), it was more or less
> natural to continue cleaning up the dp_parser until it got removed
> completely.

I see. I have resent v3 because b4 for some reason didn't pick up R-b
tags  from v2. I didn't notice that `b4 send --resend` doesn't pick up
changes and just resends the previous version.
So I must beg your pardon for the spam. I'll push R-B tags via response emails.


-- 
With best wishes
Dmitry
