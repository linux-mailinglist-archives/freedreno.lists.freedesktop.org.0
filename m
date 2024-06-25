Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29806916B35
	for <lists+freedreno@lfdr.de>; Tue, 25 Jun 2024 16:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CD410E6A2;
	Tue, 25 Jun 2024 14:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fAjyyQPt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEB710E69F
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 14:56:42 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52ce01403f6so2926355e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327400; x=1719932200; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJLpd9x26v7wF/fApEc7Qe5167IuLVph4X9sxGmlGGA=;
 b=fAjyyQPtNKpEvDNBEZrWiaj9Az6Rqn+YyFwrqg4T5YcCOPcpeXQ9YLAO1QkSVDNT6k
 8H2HJd0ZtgQeTOzAgkPJnD4g60FDuLRpS6bg1dQlhnLKc4Oc7Rcxy/LqSpdtt1voLer5
 ssoZ5R6wrkirksCnRmZW+LBgToobzA4tLxk4FnV25chl1npTvKGfRjAA0Ew2qrrSLgSL
 1DYWLwY2N1WqJGeIuG5xvsy6zEGilYOO3VnsOF8UKGEEU3o2moswIy6cKgiotisH/hMr
 WvVT70aiBr4L5+wjWss4xhTqQ8o5L7ymHj3cIUu6Wzu4gjGX2Et0Cg7iHr0WtzyYEbqc
 iVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327400; x=1719932200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJLpd9x26v7wF/fApEc7Qe5167IuLVph4X9sxGmlGGA=;
 b=jePn1bowYIHFcxNz7uNpXgq4kkcNWGJlzOXaR+q7tg3qNZH6ezWK62TDWGfjaMnin4
 rxLANgjbL1355g2cukwp2pvAVTh7eNcNzin44g5DnFiep7x2c3bXIsrdn5AJ5BbtMme+
 MkK7+C/FApWWQc7uBDbicrkQvm+TwnZEgEZAv162lgOqG6Cv0sIwhGGwgFl4peOTaFkP
 jwb3sfd1vezW1eE5F+H0DP4pgC1TLbQBoiRtim35Ky55iRneVC4455bFDTZ1SIi7RQH1
 oiOLoWq8auYlwM6Z0TJvw9gb1ZZ9aBgxN+OAiixzzoyZASoTzDo7IyxZSxyKl1X0moRZ
 mg/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/JSIzoQPjx5PzlYl+AopxuX1fOCpvSExxV7dfcUuhw4LaFMBldRFR95uhJSN2QvSiRWY0MHw+/1Ra8Wqlc350U3B47yWA6A2VbWKYG5rz
X-Gm-Message-State: AOJu0YxLozEItf6ygivWWqhepLYkj1fjVnVeT8xyeZBeQlUT735XShah
 j0kfivti6ixuqPVfg3zihb0id32e74H1TvvqDf5+vFuLqcv3UqlmU8pj9KNOE+q4M+BdIIQkw7s
 S6lk=
X-Google-Smtp-Source: AGHT+IHmVvpHX9CK7J8+9e6YEWwkWkypw8ccedGQLbNwsWmOitv3YpuJqwgIOFdVLVSEwdlgCNL28w==
X-Received: by 2002:ac2:58cb:0:b0:52c:8596:5976 with SMTP id
 2adb3069b0e04-52ce185e9c2mr3983923e87.55.1719327400338; 
 Tue, 25 Jun 2024 07:56:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd641f655sm1257321e87.162.2024.06.25.07.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:56:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: remove CRTC frame event callback
 registration
Date: Tue, 25 Jun 2024 17:56:37 +0300
Message-Id: <171932736810.1437673.14531545327158209638.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625-dpu-no-crtc-register-v3-1-1b161df13776@linaro.org>
References: <20240625-dpu-no-crtc-register-v3-1-1b161df13776@linaro.org>
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


On Tue, 25 Jun 2024 01:38:25 +0300, Dmitry Baryshkov wrote:
> The frame event callback is always set to dpu_crtc_frame_event_cb() (or
> to NULL) and the data is always either the CRTC itself or NULL
> (correpondingly). Thus drop the event callback registration, call the
> dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
> assigned using dpu_encoder_assign_crtc().
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: remove CRTC frame event callback registration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5b90752f9619

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
