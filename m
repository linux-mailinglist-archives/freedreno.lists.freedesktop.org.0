Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3E79B86EC
	for <lists+freedreno@lfdr.de>; Fri,  1 Nov 2024 00:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53DC10E94E;
	Thu, 31 Oct 2024 23:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HKQPDbZp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91A110E94F
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 23:17:53 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb4fa17044so15793901fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 16:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730416672; x=1731021472; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QukKNK+swCpoqF+HL/k+UqRGIlVJDx2v2LMxJfV7rAA=;
 b=HKQPDbZpnM1rsTRuiGepkBpImMriIY2Vh4TEKe8usUajUGkvRmRskcjhTZxNDvvD//
 18Q0MquVQCVbU5yBsPeRLGUNmbt/Ux7G4ths6ot5OxUdOYqZPdElr0fxxCWn7L33ypYS
 kpbiHcHsF0c1Fo9fucD8iBnNQC6fRA4cEg0x7QnDGRwEDhAcOOopFaM+toBKCHiDFvec
 Q9TBj8P1pwGtZvWNEEVPxUZtIqU7hj/IULOCw1oCia91V5t/oxbgebm9ScuoAQWBSZxX
 nZBwTcT5XzqJnvMRKPaca/Q0QHHEQtD56bILkiDGfJqOBvrRGCo0LEEGaOPbRzbPNA4C
 sQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730416672; x=1731021472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QukKNK+swCpoqF+HL/k+UqRGIlVJDx2v2LMxJfV7rAA=;
 b=Ot+2HlC8Arw4MJDrMOA4N2MYIjVKwp6egBbDllC86txBe3gaUE2Jzkxojk7/FpAWaY
 rGfHIXZWERI/ezdxXlrCsKvSd5huVdapH+J9Ap3AFCgafYd2yBRpFrNPw6gQLSkFvLd4
 FFZ75p+Co2Ia5M9O4wTwsOwYhCcgR0yZzkahv0qclGKlEsYkn3+TDat2ih73OY01xhJ8
 es4eS5UzFtb2PyNxGWor1WkceMSCeTUOhYEYl9qoTauBXTScbjBcKNZK7MBqX93CkZzL
 x3o4KEZl0Xn7IIZpEFjOui5RTWPsMf4SpuMqj52ed1xA8BJr6r0KxIGX6AjQvHVJbvEC
 tdzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJhmw2ctb5H2wJLDwgILelhJNtIkJBJgHP1J0c859AFKeefOufqJQiBRo50o1kxj1AOPdeI6+9VMo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJW2WHlFlgENw3vyjLtJiA0BnxtK8jVGkgtL481CA5LAKVYEW8
 VT/PEN57spY4kWMkAsVTA2dJcjKdB+Oy5XmTniVgGor21QxxmEYCjLAHU/JaQus=
X-Google-Smtp-Source: AGHT+IGY+bXC9GKLBWpNC3xXaDr+4+ypv19ingMJcsVR+qr1WR4TEu2fAF7irBNg2lVAiRV/ZDvuzQ==
X-Received: by 2002:a2e:bd08:0:b0:2fa:cf5b:1e8e with SMTP id
 38308e7fff4ca-2fedb758b32mr8745941fa.2.1730416671740; 
 Thu, 31 Oct 2024 16:17:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef617ad0sm3536041fa.67.2024.10.31.16.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 16:17:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_kalyant@quicinc.com, Gax-c <zichenxie0106@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/msm/dpu: cast crtc_clk calculation to u64 in
 _dpu_core_perf_calc_clk()
Date: Fri,  1 Nov 2024 01:17:43 +0200
Message-Id: <173041664077.3797608.9275029444644452074.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029194209.23684-1-zichenxie0106@gmail.com>
References: <20241029194209.23684-1-zichenxie0106@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Tue, 29 Oct 2024 14:42:10 -0500, Gax-c wrote:
> There may be a potential integer overflow issue in
> _dpu_core_perf_calc_clk(). crtc_clk is defined as u64, while
> mode->vtotal, mode->hdisplay, and drm_mode_vrefresh(mode) are defined as
> a smaller data type. The result of the calculation will be limited to
> "int" in this case without correct casting. In screen with high
> resolution and high refresh rate, integer overflow may happen.
> So, we recommend adding an extra cast to prevent potential
> integer overflow.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: cast crtc_clk calculation to u64 in _dpu_core_perf_calc_clk()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/20c7b42d9dbd

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
