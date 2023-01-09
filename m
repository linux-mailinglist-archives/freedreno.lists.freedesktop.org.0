Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FE166358B
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54FF10E523;
	Mon,  9 Jan 2023 23:44:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5A910E47E
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:05 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bf43so15627997lfb.6
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRAyi2n2FSarDTatQAHom6gbymd5CATd4MjDLdYU+WQ=;
 b=MQzN3h12iMrKRadC8OJ8xKFWWFDqhZ/VJPnhx0N+qFKFMuJTFkY+2buIGksW5nhlVc
 BaLPtbSVm5vjNuvnq9VSum+ZU1LmJqsgdRfXyACEsmc+qpCSq0x6DJh6NeA40u4oiasn
 K+oFiSO2TjyRJ5pv1ulJeT12NBUAFu+0fUF6XQ3hHZrFXRT6T9/BLS11UxJVy77Xwc33
 euIymblv8olgl74LAY/zxpyQag3XrkJ4jNkh/1u17PIhraMzvImFGsTMMyODenYyn8NY
 0DLe99eSp9PSGya/qKknZoVRIhT1gOd2s7IwxWjwrPfUJId7k2aO6nMRr3OaDqCfuFnC
 1NZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CRAyi2n2FSarDTatQAHom6gbymd5CATd4MjDLdYU+WQ=;
 b=g8PtK3I+PhkPX7+dcZwJXlWjDzvQvMlJ9lYiVcrkkENQiytl7mRwDyvdxKnzmCUYVc
 0C+GZiqg1v4YTnF2PVyHwMCyYqNqgRaaALlSKYi0jELTifWXLAF5fCMzw9cZkyB3bxPO
 42gFtTx4l7QUnuBm5neQ2+Hez3z2DCuQ02os0aF+fNezKlzh8SXsLLfdeat9DkNSTHqV
 vNd01Zwpx9nDYzh8oTcq8fc8YExIpcTwz6Z4lp9WZhldN+sekok0vlF8bSZ/QJi9q43z
 Uqrh3QtHOfD55f1Rl1seHSE5kzZR0iJIJ7vsm46UnjUu1UUSjMzrD9FmNtfijkxLxODv
 2Nyw==
X-Gm-Message-State: AFqh2krHUtGJdAoEE660aDuW67eqxSW9PT6DBJ76NsYziiqu1KHiSc+t
 H3RZbkT7M4CEolkz+YL3uNwVAQ==
X-Google-Smtp-Source: AMrXdXsoKpIWafS1JOF+h5zLFP43e0o0/Y8wmmadCp+bqzM9xbLffF2r6pd2BmKCKjH/6gjBJd2Zag==
X-Received: by 2002:a05:6512:3a91:b0:4b5:799b:6c8b with SMTP id
 q17-20020a0565123a9100b004b5799b6c8bmr19998411lfu.56.1673307845475; 
 Mon, 09 Jan 2023 15:44:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 10 Jan 2023 01:43:49 +0200
Message-Id: <167330408784.609993.15717302243167908042.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221107103739.8993-1-konrad.dybcio@linaro.org>
References: <20221107103739.8993-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu1: Remove INTF4 IRQ from SDM845
 IRQ mask
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Loic Poulain <loic.poulain@linaro.org>, patches@linaro.org,
 David Airlie <airlied@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 07 Nov 2022 11:37:36 +0100, Konrad Dybcio wrote:
> SDM845 only has INTF0-3 and has no business caring about the INTF4 irq.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu1: Remove INTF4 IRQ from SDM845 IRQ mask
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a685d27f2201

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
