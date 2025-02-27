Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3609AA47833
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 09:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4F010EA67;
	Thu, 27 Feb 2025 08:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z2duegJ6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1853310EA67
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 08:50:18 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-390dd35c78dso837164f8f.1
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 00:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740646216; x=1741251016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ks/IBwEcAklNTaxJVZ+LwL3mjgTmoZqvlq/i0v1O5/Q=;
 b=Z2duegJ6gmu/qhNwFqkmyHx75bTd6Bow50zebjN4gdMm1vs8vihQ9LGn6yD5pRJ18U
 KOK3Gb3KlDJ2YIIPU6BZN8/z1n9bWHlxBMOHwD3I3kLd98tzQ4SDZA+bz2w+01qDMSo3
 k0qbaVATirVuWn61ri4303+QG5ieKh80msNjyAV2UEWHo+fAAIEd1tarVyji/mkfWFKK
 n1uvpJwOypg5nUe5ZJ9UAPLEaudzRY3svpz3ej9G2Q9qN5T7tAXXVfQ0anJSAwJeA53C
 cUoJECGfvJKql1XHT+XJwoQne6y+RUTwVVrRxhA+GxglDzIE8806NtsSBg9cFGdW/lUE
 5+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740646216; x=1741251016;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ks/IBwEcAklNTaxJVZ+LwL3mjgTmoZqvlq/i0v1O5/Q=;
 b=wFZGeXaMnTKdFbh2G2pQhxTsrBh5gua3RMB9EOBnElzwp/iwfzNX71HWfRqfGvjarI
 7rj7XK9zoNpcyKMCa57nzhNzsk81qvccr2D2ZBoNAkW8mrdrwvH8UEtQlSdYSgrrJu/f
 SmqyBtP5c4djN6sv4zVkGiF1Vrn1laPTzMrpi2qF3Sfp4KsUOiPDre8sK3EPMvyDIrr+
 X4ltUTfC50Z63S8oX7+X+Wbmc5YgNXqYLgN106UnTc+OTemTxr9Ls/Y/NemGqzoRvfZM
 GNrej2LfJgyNyvGCEPXrg0RG9sJEG5eAfWVR1pT4nbsd22Ej1XA1isiKn0GmmqrzmtKF
 QxNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoB+3gVu7bIYkO2yXrRzJeDg37Ff9l5wbaBz9Uu9R0LYxDCc2VRTPpkpb7CtdMQT7aCUjKRQZx4tI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxgs1n2o0jM2k0icV9818xRZAOZlq3B16jjk0gj6w6cJxJLp/3p
 8Y+lDahowtyLBJ5kmPFh/kkyEdZCN9LZDY9T/HCpkbKYhqLw/E5LPGlH/gEhGpU=
X-Gm-Gg: ASbGncsPiSipdbImO6ygr1BfGLrKCCA3o4Ma0AmVQVU2Dc5RQZKe2G6XUMMtgrJ2Ez7
 nrRs8XGzLX2XzXkfd/l15mOr6V/UFYUKAvqwtoVOe22aNTMhjy5Bz8jUN7R/aEVnfA587lnXD9J
 b3BbS3XrOha/WlVvKIXHPJR0aeYo8ujwR4mOG5Wz46uhj9ByZHUCez97PRSHH5vTArbtvlkAYpg
 TyBR5xZxSU2lPx2rvQA9/VF5fwQeQzqSLYjqD5jyUNbvbfcM+oOP3oVa2eOY1dh8Il6s/0pe+4i
 rahhijuxgrYTNTtjv+/k9L4aX25m7oNk+pxhY9QcQS+roIw=
X-Google-Smtp-Source: AGHT+IFoYeXJ4I6jLF2jC03Em3Oo6roBaewn/6DI8FuDdaLJ1uKLliib4X2jgX4JOOl4swbvnoBEew==
X-Received: by 2002:a05:6000:1a86:b0:390:dfe9:1881 with SMTP id
 ffacd0b85a97d-390e18d23bcmr1917682f8f.27.1740646216574; 
 Thu, 27 Feb 2025 00:50:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm46894535e9.30.2025.02.27.00.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 00:50:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 marijn.suijten@somainline.org, jonathan@marek.ca, fekz115@gmail.com, 
 Danila Tikhonov <danila@jiaxyga.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux@mainlining.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20250217222431.82522-1-danila@jiaxyga.com>
References: <20250217222431.82522-1-danila@jiaxyga.com>
Subject: Re: (subset) [PATCH v2 0/4] Add and enable the panel
Message-Id: <174064621558.3904283.15224037666170321960.b4-ty@linaro.org>
Date: Thu, 27 Feb 2025 09:50:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Tue, 18 Feb 2025 01:24:27 +0300, Danila Tikhonov wrote:
> This patch series adds support for the Visionox RM692E5 panel, which is
> used on the Nothing Phone (1) and then adds it to the DTS.
> 
> Before integrating the panel into the DTS, we update the DSI code to
> allow bits-per-component (bpc) values of 10 and 12, since the Visionox
> RM692E5 panel operates at 10 bpc.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Add Visionox RM692E5
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/383c772f23869df7a31dea333ec92c9e442431d8
[2/4] drm/panel: Add Visionox RM692E5 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7cb3274341bfa5977f3c90503b632986a82705fa

-- 
Neil

