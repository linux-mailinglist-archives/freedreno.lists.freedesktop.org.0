Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11646710C5
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8A610E63B;
	Wed, 18 Jan 2023 02:06:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C4410E63B
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:40 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kt14so20933997ejc.3
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Ro+UKiTFnWqR7ixAsGV44G7PlY9+aV4RHSy/YPaCew=;
 b=FdIblvzTy8xEzoSwhdTOUjCZD52h9eQ0Hzohv4SMysKnlFML44UF0R02kkCAh0Srqz
 aU+YKAsncdy/ruDN6h3WOBzniq4R2I9HVsgn7AEyDijVa7vp7v7cOzSXPbYPYlUWrzgN
 rpKPTPjY9Aw+Xmx9BOFsCQSPSKhTI01A/DWKK+ceP70G0cpm4byVNHRA4ygLlbGBOQXs
 lqox7HbLYvzmXUQcikjwY+F+1KLe79cvZuOcGI1FroGqEEaNaSOMUZpsvSGJ0Ac8t2Q8
 bc/i9VEHDO02sE/l/dbxbIPuWhZZcql6vsxtSafdhhrgzQqsYcGOwrxKsiBP+5USq9GL
 AGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Ro+UKiTFnWqR7ixAsGV44G7PlY9+aV4RHSy/YPaCew=;
 b=reugktl3I3gO7Y8c5JGmM3snzqirovjGVaAYXgbqvCejFXlSQbu8iNGsFYYc521HWP
 Rin5pGs5fWRDnYiMYGczcQ2aL5HYn9FAb0p+zALuvVF4/t0teGv0GDU5G8en70uou1AN
 6QnIfJSwWaBEVCABQX+l7czsCf6Yj83Xy5xLTG3VSgIo8Tg+0V/ltWG0nhg+WmJhSh8W
 tHnwIOKlSzhyYP4sM7sdO/gnbqT5JGX/9lq8pL53z9Mh2vnmOoQ8JEdLFOs1/o5dSO2P
 WVJtjM01P/Iq2R0t3Z/FJJWyWqbbaPM6CekItFPsGs+DSfZDYFzOvveVRfT0cKgyfjGc
 HGsw==
X-Gm-Message-State: AFqh2krfrecDLgOBxa0O0GnmauODQKmRacjuwL7bgeuOlqArknWurNl5
 9qCjgA7i/WWa9hniBisqBnUayN1Mol7wlwOv
X-Google-Smtp-Source: AMrXdXtGPQYjPMF68auW03SQhMs99GuxBlz/jDA8pTxsHdfAUopwSfSQHcdap0FfGgwrIioBvQQnRQ==
X-Received: by 2002:a17:907:6d1d:b0:86d:d78d:61a4 with SMTP id
 sa29-20020a1709076d1d00b0086dd78d61a4mr6519220ejc.28.1674007600199; 
 Tue, 17 Jan 2023 18:06:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 18 Jan 2023 04:06:20 +0200
Message-Id: <167400670536.1683873.6162284951867935024.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112001600.12791-1-quic_abhinavk@quicinc.com>
References: <20230112001600.12791-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 1/2] drm/msm/dsi: add a helper method to
 compute the dsi byte clk
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
Cc: quic_jesszhan@quicinc.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 11 Jan 2023 16:15:59 -0800, Abhinav Kumar wrote:
> Re-arrange the dsi_calc_pclk method to two helpers, one to
> compute the DSI byte clk and the other to compute the pclk.
> 
> This makes the separation of the two clean and also allows
> clients to compute and use the dsi byte clk separately.
> 
> changes in v2:
> 	- move the assignments to definition lines
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dsi: add a helper method to compute the dsi byte clk
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8b054353375c
[2/2] drm/msm/dsi: implement opp table based check for dsi_mgr_bridge_mode_valid()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/adc5d0f5af8d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
