Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D348122A1
	for <lists+freedreno@lfdr.de>; Thu, 14 Dec 2023 00:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5FE10E870;
	Wed, 13 Dec 2023 23:11:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1768E10E86E
 for <freedreno@lists.freedesktop.org>; Wed, 13 Dec 2023 23:11:14 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bf37fd2bbso10161569e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 13 Dec 2023 15:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702509072; x=1703113872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=410xmMh9wI0DlKXfJYLEsw8ynh9trsmOzCZvI8MRMUk=;
 b=kAA16lusCRBHOnQbH6uPNNvh40swuZ9uca93vy6oMaVVQ/pDVeBkTUoaLiyLxxbyNm
 eRxPg30mHfSZ6DFh93Z5GP301VeCkcAI8LeogDeS2NMyau+CtWZueViPLdrgSYFMk5m9
 Isgp2KG6HHzMHeeZ4w6i6hEY2jm2MFg6YJ/mcYELFnFs1RyiqOtHyqVy5+3N2lPAKmmh
 +akb369+TRZ+I91om1NZV5epD8utuu3gdgMQvrYLiflHzDdBSiHHT/AJe1k9z9juu8lk
 CASNEbrlWZwepBfjUTscHPsQ7PzlkR4HJjPd4WdaREAaIEquyPXpTUDSwREE5RYE0AX/
 KWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702509072; x=1703113872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=410xmMh9wI0DlKXfJYLEsw8ynh9trsmOzCZvI8MRMUk=;
 b=h91dUzey4cjfzlJVQC7buSA5r9X4xRzgROo6TN0ngfbG/2W3SR91s5kzPvGmGk/OOx
 9QqNZpWrACrbv/wzw5BbcYC3Tj3Xb0FwcQrg4QWA+x20iS5eFCt6uMewm3fCF2wBv5Es
 N56OXsYuiTtwN8Uf1HbuZkn6ZPPO6NqKIZBCzMHbcZsaVQEbGvDVZjTsYm/UwAILbwtp
 0TmOC34B/1NOWRBdj6IS9mtheDMoEcNtnrie8LQCyq24Vcq8/6NrCQJANMEdULh1C7/a
 LnnLuDZvd+6MTgmaTjRi8BgsYCkYgMrhKePH9e3cRseiO+xvbdMYbhWFQySvBL21NCst
 anBg==
X-Gm-Message-State: AOJu0Yw9gd4/TeAmiBCBFNkNDyoBGXMulNmbGRl9YqHC+i7c2l4BEyRx
 DV2KscnwCipoyN8OGVG8ppwo3A==
X-Google-Smtp-Source: AGHT+IFW0HTuKja68bq3+gufhbCMqXQOdE6R3AajcRo7Nwrfvtlw8J4+0aqI/UQucNrWQb8LaPTBgw==
X-Received: by 2002:a05:6512:2350:b0:50b:f3fc:1261 with SMTP id
 p16-20020a056512235000b0050bf3fc1261mr5416444lfu.1.1702509072176; 
 Wed, 13 Dec 2023 15:11:12 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u17-20020ac248b1000000b0050c031e2873sm1735908lfg.288.2023.12.13.15.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 15:11:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dp: call dp_display_get_next_bridge() during probe
Date: Thu, 14 Dec 2023 01:11:10 +0200
Message-Id: <170250905096.800728.7488984518759894282.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
References: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 07 Nov 2023 02:43:33 +0200, Dmitry Baryshkov wrote:
> The funcion dp_display_get_next_bridge() can return -EPROBE_DEFER if the
> next bridge is not (yet) available. However returning -EPROBE_DEFER from
> msm_dp_modeset_init() is not ideal. This leads to -EPROBE return from
> component_bind, which can easily result in -EPROBE_DEFR loops.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: call dp_display_get_next_bridge() during probe
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a242720884f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
