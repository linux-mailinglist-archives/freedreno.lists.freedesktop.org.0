Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EB9663594
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4390610E519;
	Mon,  9 Jan 2023 23:44:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E494110E513
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:05 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id cf42so15636199lfb.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJYCXzCwWlmnquQ5yNkG+nGz0jiVnLUqp4W9MaxrD4s=;
 b=RIPP0LX1WVF/EwnvQtIj9jJQabFc2G1iyrCosOv6yvEXLxKIHVdJDa5nwzFlLU/isO
 0xnLLL5EcOekI5uHkhLcnOZkUzGqP13Fl069NnVwv590tcKGPg3rMP2n6zpfmK3YDaJE
 eGnaxtnchWCtqGKaR7uPRGw4kb7tdACQwLpKtFyBC1DWYDTAqRDvA+S7+tDj+oXg4mY3
 v1iTvaAsh+tf7nI/gZsUcWZzWx/htWgqmh1ovXPig19o4FEoJuvEvoo2Q9SpbcWXGL9H
 kYb169Z+TIdUuBIzLlqfhpKvwMDvzog7fpoE/POg+/+ckFqidCkW+15WFd1r42qEAkIk
 Z2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJYCXzCwWlmnquQ5yNkG+nGz0jiVnLUqp4W9MaxrD4s=;
 b=M3Y2CK6k5/sn3lCsNxX6OzhQepnAdHgTruWkFhCV2UcYplT3AQpRDJRJ0JjPEFmeGP
 ycQ9co8YxzpHVTGd7KvQkKuKRqOe0bD7PreSmLTTr8FNFqBzN8uPpBeKFHlaq03dIhkJ
 gdIIXMER6vBpb63xPX/oIlQBgyZpokOanP1QsFekfUDLUZdJP6KS2eN4b5CrRICYlEgp
 pGj5vs6NxxpHhaK8SOkBTw/bJd2pFGJ4theLl2situgY1oO9veGWTDclEmZebGcnnORP
 l+Vqp1FbafpLaRUMVl2AtThoCBKzq/hVjNzTj66CRbt6gcbTkYNsqzZaLdIS7RyCdAX7
 eEjw==
X-Gm-Message-State: AFqh2krhiZEykcWJWLy/WBbE7xVMriRUWWAmx+KqVYGa4dXQmQwuAIX2
 PDhsGbIO90aHUl+qt1M6WVwleQ==
X-Google-Smtp-Source: AMrXdXvhuCtr9p3TaitJ7JU10h9BQxbrBE5HONX1QxhdjdTu1u8Jk5LG3EXWzIioN5/bOobU+UeVjg==
X-Received: by 2002:a05:6512:3f0c:b0:4b5:2ef3:fd2b with SMTP id
 y12-20020a0565123f0c00b004b52ef3fd2bmr21828551lfa.18.1673307844326; 
 Mon, 09 Jan 2023 15:44:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, swboyd@chromium.org,
 quic_khsieh@quicinc.com, johan+linaro@kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Date: Tue, 10 Jan 2023 01:43:48 +0200
Message-Id: <167330408781.609993.12402793226257634056.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
References: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/hdmi: Add missing check for
 alloc_ordered_workqueue
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 06 Jan 2023 10:30:11 +0800, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference in `hdmi_hdcp.c` and
> `hdmi_hpd.c`.
> 
> 

Applied, thanks!

[1/1] drm/msm/hdmi: Add missing check for alloc_ordered_workqueue
      https://gitlab.freedesktop.org/lumag/msm/-/commit/afe4cb96153a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
