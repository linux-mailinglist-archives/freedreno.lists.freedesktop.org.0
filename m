Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEC6663585
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC90C10E0CF;
	Mon,  9 Jan 2023 23:44:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B941C10E0D6
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:02 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bp15so15588823lfb.13
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qvBs6bEDKtP8wO7hsql6N2nN0eBA0Rd5yITdA/W0fD0=;
 b=WymG9EYGwNpjOZu8XQGCmmXAH0fdbVSfAdqaleh8KnZy6WB8NMETRkYJmyFOFlaYpm
 DN/Pfpnv/qgNcOaCLoWLJApnt8Z9jX+rLqWOUx54nwg3IoO68WGmOUUNj/9d5vN6FXsM
 YTc98Kd7z0qbS65xFtl0KgN9j+x/NV1pRnHK7TaxOQ7x6K7Fwow/uJpPkrEYKt6Hq3DB
 1fa13/BQczvW/zOYdUGNfJuQGs/cHyJgTPFqARKfjxtINz8JkkgSSoiTRwjmPNBds59u
 TOVzpSXn7nOVmXYhKbfPOagwaXtjOaBb7DbkFAbhy5Uw6PcLYTe5c7hYr4Qe120+ayjS
 ejyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qvBs6bEDKtP8wO7hsql6N2nN0eBA0Rd5yITdA/W0fD0=;
 b=ypYv2ruVjT9a5VzQVcB8u6xzrrGMfKNSs9ytJa8+Wx51mYqaEK7wsL3pdu01smIqqo
 vYkfNIKRAUuDti+UL/3/miy963+zhF4kLsRXXrI85zum9FuM7MrhfYGKpsIZP13ky94o
 HiGCxMEMXF8D8GCw2QMUvHnHxQlEoe+LctuMSt+zJK8wlxp0XDGbHfauMQ99wveizDLG
 vhm4ecDTpDsqjQq+R0lm3pv5Bm0orfWV1pDwGGtVXHFG+vxHSbKpn3YMUa2Fz4hwZyiF
 4w6cIGgEHSxj3mKV2gqeq3FFSDb3KfefJtXV+nXKdi0KCiddNcjJ+I22FDRqmJolrT3s
 qchQ==
X-Gm-Message-State: AFqh2koTK8HsWOKsobWqNATQM8MJWDykNzjyP6/7RtSV+/u39/2eCope
 V1Hz1euB10oz52hw+cytf5u8bw==
X-Google-Smtp-Source: AMrXdXtUH8/HDneehsv7HPVZGtwvYhSPv9laSh5y/3e00019/hxA5LPGKbrp+Bri2WRSow/UlphJvg==
X-Received: by 2002:a05:6512:c01:b0:4cb:3449:1354 with SMTP id
 z1-20020a0565120c0100b004cb34491354mr9712298lfu.22.1673307840979; 
 Mon, 09 Jan 2023 15:44:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Jan 2023 01:43:44 +0200
Message-Id: <167330408776.609993.2562174494126788375.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
References: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: display/msm: gpu: add rbcpr
 clock
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 07:44:07 +0200, Dmitry Baryshkov wrote:
> Describe the RBCPR clock used on msm8996 (A530), MSM8998 (A540) and
> SDM630/660 (A508/A512).
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: gpu: add rbcpr clock
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9bf1e33f9ca8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
