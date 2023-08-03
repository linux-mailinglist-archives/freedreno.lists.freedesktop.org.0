Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B076E6A7
	for <lists+freedreno@lfdr.de>; Thu,  3 Aug 2023 13:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEC010E5FC;
	Thu,  3 Aug 2023 11:18:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF6410E5F5
 for <freedreno@lists.freedesktop.org>; Thu,  3 Aug 2023 11:18:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe2de785e7so1499729e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 03 Aug 2023 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691061515; x=1691666315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbHS6G+E5ew6ukOcvSxZbb7o08XJK+VVOu6GlWaMLPY=;
 b=Ezx62w0NkkQ2W7RPIfEX5KiXiIDOXDRGzvxiWHJtZ+Mo4+WiVx+4Mm0XTE/9Rc5cAx
 pcearRiloj+28lHxm83ZlODolQNNXm6XGduRwyonetEDLfzq6JBUxZ+y6gJzUSJNZNiF
 YbgpP8y1zhTGoF9tYHhmwh0GKRPDOrrhVJpa/h0+ZFQT0Pai8yP8dLuCWYJ1blv/0JBX
 sW9XzLha5rsMAeWkK4XgHF1zp/F+vLLUK9pxG21u6ZzpOnhO/cUVK0egvE1imtdVUwjk
 6Ye5daf3gxC/3zzazD6+4Too7Skwn0LxTngdUV7DVCVdj9acK+X3BLg8qpgZ7CVUCVyb
 rNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691061515; x=1691666315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rbHS6G+E5ew6ukOcvSxZbb7o08XJK+VVOu6GlWaMLPY=;
 b=GIVciImuhFtAwPo60hvmKxzb+t4YbsvEkFIpnZXLVytVOTh/MLKaKk/3nbjqiu2m+E
 m6PRuWKeINGm4woQJSqWp7Pv75QnMn4OT7XytbeoN9lvaXI6D76D616wUsu4f4+qSCEX
 s4jpRQEWJPVJQB8d9AHf2Grf7SQ9qL55Ba8uuwN5SQWEOPpRhQMT8pqqIx2V6Rkk9HVn
 /tK21GV2ZJv3gIsga0VSJ7R0VyMJKa+Inq90zQshPPi6z91zRzpWUmy3+Mtgr/sdyyww
 7F2LGw1p1sVnjrmIiIqjcZ3OiaKDAd7C4Hd1YClHglIunj4kEUAc0xjaXjxiLKS+whnM
 Kk+w==
X-Gm-Message-State: ABy/qLZBSGhwsM+T4GqlheSJIiCQbxnW79QUQnVawsAP4jClKQ8u30ry
 3hum6dv5T00NBn52VJNf7vuk800z3p5xxafAvhGw0A==
X-Google-Smtp-Source: APBJJlGlLC32wnQ+ROJ9sEig2uRPBUqQcJgdNoL8amDhUgC2YK8CenUOjuw4GvfOcbt+WN+mqfRJJw==
X-Received: by 2002:a05:6512:3d91:b0:4fb:893a:d322 with SMTP id
 k17-20020a0565123d9100b004fb893ad322mr9200736lfv.68.1691061515201; 
 Thu, 03 Aug 2023 04:18:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056512092e00b004edc72be17csm3296417lft.2.2023.08.03.04.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 04:18:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Jonathan Marek <jonathan@marek.ca>
Date: Thu,  3 Aug 2023 14:18:33 +0300
Message-Id: <169106148047.4192382.5517957454190733148.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802134900.30435-1-jonathan@marek.ca>
References: <20230802134900.30435-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: increase memtype count to 16
 for sm8550
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 02 Aug 2023 09:48:53 -0400, Jonathan Marek wrote:
> sm8550 has 16 vbif clients.
> 
> This fixes the extra 2 clients (DMA4/DMA5) not having their memtype
> initialized. This fixes DMA4/DMA5 planes not displaying correctly.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: increase memtype count to 16 for sm8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/42d0d253ed03

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
