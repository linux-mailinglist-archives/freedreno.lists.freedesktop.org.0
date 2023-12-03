Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300338022F1
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF34D10E28C;
	Sun,  3 Dec 2023 11:27:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F38A10E13C
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:43 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50be24167efso1569847e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602801; x=1702207601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JDvSSyhIogsacvQW40yMxNj+Caft2xG+QOP3JVD4tRY=;
 b=P+2E89+hbQJrCxhYT5jnReAW+1LmDA7tNWlJQZcGro5sTqrW7V8SXn5hjqkE2ueyBH
 Xs4Hq2SPa/TZefbXKxltf15DRnLSiywR1FGLNiTN3A3BlDgrbwYXfv4kMrG4W3TgLvp6
 rVyvnjSZTbW3wtx2ZUPp6WKxWRw6MEUY5JWiMk4Vk/qEYkCzHaV43uLY7ix6tW7Pzqpx
 N5kf4gjcbAiMO6WgO9ovNPeSm+RtBx6gIBcRXLeQo7dBm7jLP/Od1ioqgJQJEQB4HyEC
 2I8D6EIX4aGj1T33MJ4YN9yylQuZUcvdnPcogSXa8mT9LnoeEzTibgSbCYEY993cgg05
 t6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602801; x=1702207601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JDvSSyhIogsacvQW40yMxNj+Caft2xG+QOP3JVD4tRY=;
 b=PbrEwb+32U+C4ywYXRfL2ndp+z6E5m/aRM2C1NfQpn2Ol42FY44VznwyQ+kyILXsUj
 VANhLqa6QnKJdbvVKbEiZQq8ZtYjCqjUU4DCnYSv4EG+cd2cYsFqBI2gpCq2Q6WFUpBG
 v7sL4JO431ZVn+UUXqD6U6xl5hnYjNcqJD2RVjR1DH1NVmQboTFymYjWEoOpHNKcAv1m
 PmmFE1tFeEOHamSQIn8yIqzTTdnRPtDI6jgVamPEBNrpwsob+1IdxX0NSXaZ70BO4+jV
 3IPw0o5/hCobc8Y6fH394y58xmk2XFSh8xk/i4u1xem81R/IbotOSCdD1ctHbq0YugVO
 hBqQ==
X-Gm-Message-State: AOJu0YxcYjLEDwNOQzf6POiy/IOduoS//9yEBsWypKIYxjuGDtxOlAdl
 cRpcHoFx5zM594JWRhL0dnk90nsGyQyknWHDl6M=
X-Google-Smtp-Source: AGHT+IHeQWsaMBnunkzlkzcMxwXy3zyg7txAp2V9eKonjJ9riO+tx8XwpNeNPJTEU8JMafH3go4NbA==
X-Received: by 2002:a05:6512:10d4:b0:50b:f04e:6629 with SMTP id
 k20-20020a05651210d400b0050bf04e6629mr180503lfg.224.1701602801775; 
 Sun, 03 Dec 2023 03:26:41 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun,  3 Dec 2023 14:26:26 +0300
Message-Id: <170160265547.1305159.4757803162001385229.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908193314.27008-1-quic_abhinavk@quicinc.com>
References: <20230908193314.27008-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: enable smartdma on sm8350
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_parellan@quicinc.com,
 quic_jesszhan@quicinc.com, nespera@igalia.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 08 Sep 2023 12:33:13 -0700, Abhinav Kumar wrote:
> To support high resolutions on sm8350, enable smartdma
> in its catalog.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: enable smartdma on sm8350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/921e32bf6c0c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
