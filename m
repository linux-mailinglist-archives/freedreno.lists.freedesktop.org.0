Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B705916E3C
	for <lists+freedreno@lfdr.de>; Tue, 25 Jun 2024 18:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3D889F71;
	Tue, 25 Jun 2024 16:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xu35Bmz4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5F389F71
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 16:38:27 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so6770583e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 09:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719333505; x=1719938305; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qEtrqqKgtRO3segRtAhqbjDeDlPr4qQZMrM9hddNVII=;
 b=xu35Bmz4l6TulvfUtDG11tS0sSuGPR1GHX89hS5bUwvI+YmKC2pnCdVUTiZuCcJg8C
 Hm+MiheQS6Tj6tF2HMJMDoS5o6uCFw4S6jlgC4QuklUnVvkluBAKEKkVV5ESkStoA1Lr
 SNABX5IqWdmxLJQ3KlnoPcLOOsrywJ2U09pO6FMXL99Lk4796QfHp90NxGn0+ILcmpcy
 46J6ItTRTWBWYqShVaq/yVPNKwoaSdnbp68/yKbklU+ghkwGKS9hUg5qXucKPjlMgD9N
 NC5801koDRH058vpHDbQsQj+kU+HoKOPRvfttY6aer8ak1HKxCuHmzq7RPn5KQd8tQsV
 W3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719333505; x=1719938305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qEtrqqKgtRO3segRtAhqbjDeDlPr4qQZMrM9hddNVII=;
 b=U0YyEaXfwRBebiORs47ftZU56+JgJL6fdBtPuzD6FntSpsJwVAkukecSVWs/LFoCIH
 5/IhY+DX4BUUxZq7XY82S3l/5MFzqzs7bxsvvq1p+B9fm0t1pbzMnYtgIL7vi0W0k2qL
 BP3iBu9OUujjBswg5CumHHy6A/trek68rTV7Q+/Zbx+r76F8Bf9k+3E1060q96BJH+uf
 6tyBRg+DjN05+6KR7b2GmCCmltEnZZe2nnPuEPcOEV5yCVJXBT0x1T/mPt2hrV16Ws93
 ZRgdlvWlgHULA0so6nM6SznzpwegdbF3uZv3PHkiOqhP+cdvIQnlgzJ1lT5homAG0hkW
 d5SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmDPvW9yX9+x3or+Wg7peToIxz3qojS99Pj+F83F/YJa347rvaq9rDPPCK6KU1H73mOcky/P01E6fVhxMRLDDnmS9lBrHmMQ2WKnHlG3YU
X-Gm-Message-State: AOJu0Yw+Jjpgm4IccUsRzhgON+nxkX8e3l8q5CAmLFJxVimzfJB4QGNs
 atTx3Lpf+1tU4IBXLXldufKrt8dNaHQsx+VshTS3VPRaLVJWWioFY+frw1kx13I=
X-Google-Smtp-Source: AGHT+IGrVM7bxfj5E0NLOizkSNAMbKYyDeP6D7vX6g9112K5WjgHB+dI6y702l8DZVu2A3yUQkzUwA==
X-Received: by 2002:a05:6512:114c:b0:52c:ebd0:609 with SMTP id
 2adb3069b0e04-52cebd006bdmr4692306e87.7.1719333505154; 
 Tue, 25 Jun 2024 09:38:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce448514fsm675400e87.265.2024.06.25.09.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 09:38:24 -0700 (PDT)
Date: Tue, 25 Jun 2024 19:38:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/bridge-connector: reset the HDMI connector
 state
Message-ID: <ov4uvlcyzfqw55g567jikyceivpkl7l3ijuol53fqsv2asdgrl@miggxlyyeiek>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-1-8590d44912ce@linaro.org>
 <20240625-feathered-loon-of-health-ec7e6d@houat>
 <CAA8EJpq314tQFZpkXgL1cYDPfoFRukhB_KiaDvmsqdzHFD512g@mail.gmail.com>
 <20240625-jackrabbit-of-major-ampleness-e0becb@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625-jackrabbit-of-major-ampleness-e0becb@houat>
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

On Tue, Jun 25, 2024 at 05:49:54PM GMT, Maxime Ripard wrote:
> On Tue, Jun 25, 2024 at 06:05:33PM GMT, Dmitry Baryshkov wrote:
> > On Tue, 25 Jun 2024 at 18:02, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > On Sun, Jun 23, 2024 at 08:40:12AM GMT, Dmitry Baryshkov wrote:
> > > > On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
> > > > IGT chokes on the max_bpc property in several kms_properties tests due
> > > > to the the drm_bridge_connector failing to reset HDMI-related
> > > > properties.
> > > >
> > > > Call __drm_atomic_helper_connector_hdmi_reset() if there is a
> > > > the drm_bridge_connector has bridge_hdmi.
> > > >
> > > > Note, the __drm_atomic_helper_connector_hdmi_reset() is moved to
> > > > drm_atomic_state_helper.c because drm_bridge_connector.c can not depend
> > > > on DRM_DISPLAY_HDMI_STATE_HELPER. At the same time it is impossible to
> > > > call this function from HDMI bridges, there is is no function that
> > > > corresponds to the drm_connector_funcs::reset().
> > >
> > > Why can't it depend on DRM_DISPLAY_HDMI_STATE_HELPER?
> > 
> > Is it okay to have DRM_KMS_HELPER to depend unconditionally or select
> > DRM_DISPLAY_HDMI_STATE_HELPER?
> 
> No, but it's not clear to me why drm_bridge_connector is part of
> DRM_KMS_HELPER? It doesn't seem to be called from the core but only
> drivers, just like DRM_PANEL_BRIDGE which has a separate config option

But then DRM_PANEL_BRIDGE is also linked into drm_kms_helper.ko. I can't
really say that I understand the definition of various helper modules,
but my taste tells me that code from drm/*.c should not depend directly
on the code from drm/display/*.c.

-- 
With best wishes
Dmitry
