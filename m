Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2938F671099
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE1810E634;
	Wed, 18 Jan 2023 02:06:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA1E10E634
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:29 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id tz11so15428517ejc.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0JiIW4jdJdESp+XWdfOpWNkOvZv4eYC/Zwku6YKYIAo=;
 b=uaVExwDWCIJ0xQwsFvsIky+V+xINrX9hCx2pfSTY5maDB97Q1+SHOgSWIOd9Y85DEu
 qivbNZNWA7oug2IwDwENI40xE5EoTcKsYxycv1UKezFBQCdgcpniTeZkwUt2IaT6elWU
 LE0oTGaq3h1+e8Wkv8/S9kWPkvczwIlN+4M17pv4geo6kMJteYsmveZp7DkvpLd/fajW
 Q2Aqv5CTIToBIV7Oud5LIdOuWFFPf7uHSqacKbyl6plbDDWp1E9S5mP/fB39tAB73kRb
 5oRzR3TaZ2fIhzLyc8mfTuAFNTgRcCho5wfyj0dKTa07PFJHJ9lqu26vmk+lWum80WPm
 3w+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0JiIW4jdJdESp+XWdfOpWNkOvZv4eYC/Zwku6YKYIAo=;
 b=YqH+vnPmpaQeT6aPaol64VMSKU63gNZzt5KUnRiBijiCLueAfk6L4wc1syz1hxXO9r
 YD8Bxa7Kpvrc4O5QxKSr/k5awbdn+6gN9zbQ0zhAWSAvC/ZaEMlqaZgEGQ9Z6Tt9QoZN
 7iB2Du34AdZFCagXIj7khav6buHhX4uICMFsQLMA+zNK/jGN4MxqHpOAvS26i7bf3vb1
 RK/mxWuZFsOnFCbR7I9Bg9C1cuBvrnd7BUM2oaUsi46nL6K5GjZqJAxwnvbDknukw5HC
 xA9LnHHF0WjTc+hD25QeZyaDEgbjAodhI+59vtMTieLpVYFdpB3K5ELVkxirmmnsXfr2
 vX7Q==
X-Gm-Message-State: AFqh2krxdinX27XXMmUHUBYjL1nmZeoQkPt0usYkXTPCz0RuCAiEgsvE
 fdIvrdEGktf4WYMc2YUXWrhOSA==
X-Google-Smtp-Source: AMrXdXuJIiZAj16VZgUuBRqA2k8+gGkvW5kulFivi6sXooiaAxXwgafM57hBk4Cu3ulhpAJuOQb6+Q==
X-Received: by 2002:a17:906:ae86:b0:84d:3d88:dff3 with SMTP id
 md6-20020a170906ae8600b0084d3d88dff3mr5179129ejb.25.1674007587942; 
 Tue, 17 Jan 2023 18:06:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Jan 2023 04:06:10 +0200
Message-Id: <167400670535.1683873.9301034219626704629.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112053659.1361298-1-dmitry.baryshkov@linaro.org>
References: <20230112053659.1361298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: merge two CRTC debugfs dirs
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Thu, 12 Jan 2023 07:36:59 +0200, Dmitry Baryshkov wrote:
> For each CRTC we are creating two different debugfs directories one
> using crtc index (created automatically for the CRC files) and another
> one using CRTC name/object ID (for state and status files).
> 
> This can be confusing, so move our custom files to crtc->debugfs_entry,
> effetively merging two debugfs dirs.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: merge two CRTC debugfs dirs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f377ea2c3c3a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
