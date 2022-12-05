Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A5B6435E7
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 21:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2006710E29B;
	Mon,  5 Dec 2022 20:43:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E09B10E29B
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 20:43:27 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a19so14983860ljk.0
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 12:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HmaZKD4MQBPxWz7myy+7Xl+FJO9eTlwx8WOUjYiCzSo=;
 b=mnCoB6HI9JGjaPcUmGYmhX9UeoDTZST4gvYm5hJpf6rgCm8hvZVCydPLypzk3Fz1ZG
 02aR0TIv+KYzQIhm3DXlLxPtOziybd/aQ9mLt7fqw1BGrnepIgwHqevggXb1/5NTNMFl
 JiWx0hKOvHiI/EF7skV0Qr4MbflsNlWWrXc45yumu1FHJgcc1tajtplho9mLF19aOXm7
 rXVK/mPBVNeBZ9ISEG2y7GteSkR5SVTq10WfoiyjbeEgSysAWCD9ZBH+ghj7YGr78XTw
 XJMVw17Y2F1Q7q06dZ+KXJ0o6VVFJlcDERdlK1R+2wj1vpQdZaGS6y5vITgmUdCm/3bF
 /LkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HmaZKD4MQBPxWz7myy+7Xl+FJO9eTlwx8WOUjYiCzSo=;
 b=jQ4l4CUGuJ8OvUSqmElC9/uN1jZEHZmsmNA2RJQMFCAuFpQ+x0fH6DUzqnpw6UrgL8
 OmHje9IZg9cYK7NB6Rz9qRWq5tmWPM8MfQ28fvQ9HrQDU5ekGQNpMtOSdko0McGL0Onz
 laJdHSDYxWJ+Z5IYBYa1rWK4Jr1LGA/so9k52ZD6uUS2Ls9as4ALYoi8pRmd3vdl+Ksd
 q9SP2vdyibOwoOERQ5PUiWw7lS+WaLw/Z+eu3BCah3xDvvwgy+oEWDKeCK1Ku6x1VtFk
 RkzKCe5GI0KcCVtbXvQzObtubvxnq+L3wg4te7Xpd6cGm6C7IL19Q8SzmfgPyc7/V866
 lW7Q==
X-Gm-Message-State: ANoB5pkWPZ0XhxHuKtyjKWLo+Ko67bBysB3ZZFhq/e4vFhmvzdRgRgEb
 4b6uzDpKDi8r3w3c+BFClXPJgg==
X-Google-Smtp-Source: AA0mqf5xzi3HZkNjdnxCGu52MWyOjT/GrhJPV1I9+r3FwX5sb6XBSx85qfDj813B3AB/1ZPxOBNzwg==
X-Received: by 2002:a05:651c:1592:b0:277:2123:120e with SMTP id
 h18-20020a05651c159200b002772123120emr27765161ljq.4.1670273005668; 
 Mon, 05 Dec 2022 12:43:25 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129]) by smtp.gmail.com with ESMTPSA id
 s22-20020a056512315600b004b55b404d36sm1198865lfi.156.2022.12.05.12.43.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Dec 2022 12:43:25 -0800 (PST)
Date: Mon, 05 Dec 2022 23:43:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
User-Agent: K-9 Mail for Android
In-Reply-To: <1670267670-15832-4-git-send-email-quic_khsieh@quicinc.com>
References: <1670267670-15832-1-git-send-email-quic_khsieh@quicinc.com>
 <1670267670-15832-4-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <FF3CEDC6-E548-49BD-9695-DCF68C617024@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v8 3/5] drm/msm/dp: parser data-lanes as
 property of dp_out endpoint
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 5 December 2022 22:14:28 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc=
=2Ecom> wrote:
>Add capability to parser data-lanes as property of dp_out endpoint=2E
>Also retain the original capability to parser data-lanes as property
>of mdss_dp node to handle legacy case=2E
>
>Changes in v6:
>-- first patch after split parser patch into two
>
>Changes in v7:
>-- check "data-lanes" from endpoint first
>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>---

--=20
With best wishes
Dmitry
