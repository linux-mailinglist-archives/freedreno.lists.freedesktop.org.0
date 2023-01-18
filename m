Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517436710C0
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6237710E643;
	Wed, 18 Jan 2023 02:06:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB9310E640
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:42 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id v6so36822380ejg.6
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KLPgSw0irM5YzAF5nZ346rzglXvudc7WJVvK+w5PcIU=;
 b=wWQtCktXZaI6BanHhfkK0swKa4aLr3ijictfcdpe7XnxB7LMUp9tt+Givr4t5doTNZ
 1RcMJZ0GihusQQDF+YsYJo/r/m7p5BLn+ZVokpirswxYYLgGmqeDgMJ1mSmSCLbnqoh5
 l/fvQdzYHNV8pYDyprky76jUOHs20Om2Qvi2qXalD6ruNVVzuImfWHjKTUPJNYyI7f+D
 GabJ7wTVugFzH/BMElRbvILAWYHtK3B6tTl9KsEkZkpt0mG5L9/+yNA42kBt1ywmLzlh
 zGWuVl4UtaI0qzgtC6GXMj9yCTLFRGr8/kgt3wziSu4eIGnqsShwuP3TPMdKYkdY3Bxl
 LhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KLPgSw0irM5YzAF5nZ346rzglXvudc7WJVvK+w5PcIU=;
 b=giTxTEzzDoJupoUas1JfyCHdoq5W+g7WfceinSNNDvhGhIB4hldTt7fRZIH6oufmAZ
 K0ZlaF1W3xKZbmy5CvyeW7LgLwRtYgYCyIsxrzppGe0m0Li310Al0OdSb5JNvR8xPry3
 DlBtedyAuv0iJeuLsU0xI2zRES0dBV7mCfsc7ShD+TTBTy8hdbt56ioogoXIGgn0Kxno
 MfYN346ToV3UXmxBXy6o7FvmbpwxHhlEOeP16sseIEnIzw5MkNNKpv6TsGaaqSu9yx7C
 0w583OSGkMddk6k+cFYrKryxRhnzz5LH5PS0PCKMnoo/KexXCM5FYXzwaYiPQex7+wND
 p12g==
X-Gm-Message-State: AFqh2krZhmSlYmu6w0okD4bVoudQ3DkV14Bheq/T98he2FtPdIk5QZZw
 RTR5O94sd9vZX5jQrCiHDahrig==
X-Google-Smtp-Source: AMrXdXvVpUEZsx3KcELZ64o0nenozD8z4wMbxcHvAeSa0WZDEiedT8sOTPcjC+HYhUBReAflau+nog==
X-Received: by 2002:a17:906:f1d6:b0:86e:7896:80d4 with SMTP id
 gx22-20020a170906f1d600b0086e789680d4mr5137016ejb.49.1674007601304; 
 Tue, 17 Jan 2023 18:06:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Wed, 18 Jan 2023 04:06:21 +0200
Message-Id: <167400670531.1683873.4513062713172900376.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117172951.2748456-1-quic_bjorande@quicinc.com>
References: <20230117172951.2748456-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Remove INIT_SETUP delay
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 17 Jan 2023 09:29:51 -0800, Bjorn Andersson wrote:
> During initalization of the DisplayPort controller an EV_HPD_INIT_SETUP
> event is generated, but with a delay of 100 units. This delay existed to
> circumvent bug in the QMP combo PHY driver, where if the DP part was
> powered up before USB, the common properties would not be properly
> initialized - and USB wouldn't work.
> 
> This issue was resolved in the recent refactoring of the QMP driver,
> so it's now possible to remove this delay.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: Remove INIT_SETUP delay
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e17af1c9d861

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
