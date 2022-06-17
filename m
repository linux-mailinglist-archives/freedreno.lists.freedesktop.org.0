Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6B54FE2E
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 22:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC5B112CA8;
	Fri, 17 Jun 2022 20:15:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373CA112CA8
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 20:15:48 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so6821378fac.9
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 13:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=b27oiy6RHsUuT4Jjsfq7MJzNlUIQ2e5S3fHVAYvBtmE=;
 b=MA73/fhxKHTJ8uYDabaVtaMIiRBaepXPKVxGSSWGPGPA2K1mqga8UkOGtOeNIJJqIO
 4OOgQtLefRA+PHn0QrdoZTC2XY0RYPEac/Mb+GH7iF3qNpejDkZY6/2x8aZICMuKDH2S
 z7MCvFPVqJMwu5Xb67PjrtVxFReaJimZerCZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=b27oiy6RHsUuT4Jjsfq7MJzNlUIQ2e5S3fHVAYvBtmE=;
 b=KfRlaGgMmO6llHHjHrYDTkc3izk/Hz4OfkvkRCMpwgtDTLS1MUk6RYo9QmSivKk1my
 9VSZ5vfy4MkIx8AbWVBAaM+cIPdVDPjcM/wAvNJN8mlpzBcqVGUzbQLxuM2jpUuYzCyw
 GS9LpN3S/iaTFMDVyleLsRLEeRje2C1YdJ3by3VlxiRa54jsrASnEzHvyXUKZUtKwcYc
 UT01pGll2fMqB/UDf2dhwDSLzOzCIXUMJMh/audys2AfutIqyqRHkp9clvgAg6z5l5J6
 YQhRb4hw9w3YxzB7/F3I3BQcoE6ZDKTT/HXmb4txT8hjhIXUxBVmfRjk7/8/KDfTocgc
 dB3A==
X-Gm-Message-State: AJIora/gA3DTSy6lSfWrOTkt4Bpcyxn78hnZja9VlvlPWoxZlleFWc9v
 5AbHAXaYHbKYHcyPI00Kb8bLdMM0H9Bmj40FuhtAsA==
X-Google-Smtp-Source: AGRyM1vYWj5adjCr3oqYPXmSERpaa+NbEphqPPLnMroCJl0YCDYzfPeLgt++eJ4q9h+s/lTqKE32SR9fXSpMZc8eeNE=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr6489018oap.63.1655496947391; Fri, 17 Jun
 2022 13:15:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:15:47 -0700
MIME-Version: 1.0
In-Reply-To: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
References: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:15:47 -0700
Message-ID: <CAE-0n52VABr2xTbEtVyat8CLV=vzgRB3JQV+Undw56ECiHR-Ow@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dp: remove unused stubs
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 12:49:20)
> Refactoring DP code transformed several functions into empty stubs.
> Remove them.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
