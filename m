Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB00787C029
	for <lists+freedreno@lfdr.de>; Thu, 14 Mar 2024 16:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C190A10E995;
	Thu, 14 Mar 2024 15:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="j1xM3MVu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F078410EEA6
 for <freedreno@lists.freedesktop.org>; Thu, 14 Mar 2024 15:29:32 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7881fae7208so46523585a.0
 for <freedreno@lists.freedesktop.org>; Thu, 14 Mar 2024 08:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710430171; x=1711034971;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tuhQc5l9apEej2H4LOTY9yaoxPUBJy/wLmmpg/Pkruk=;
 b=j1xM3MVup0J/mS1dIYCQ8JpKmOo92XsbhDyEaRH4RigNTgX8zzx4PkzeSvLi8jBRR9
 5PqpTmTDe68D/ng3vBQOR0OJQW6ag5HQA7frcXaiOTRwQ7gEaEtfeaoRIuRFJidDl20a
 mBD7Pc6wNdIurlESu1g9pWPemqDhrpdfCbq1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710430171; x=1711034971;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tuhQc5l9apEej2H4LOTY9yaoxPUBJy/wLmmpg/Pkruk=;
 b=G/ht4l4VZAYmekDHEzvwCtRefyfVBy8bZ8VeM0h+EMor8MsIuOP8weOJA+9Wgh/e8h
 SISJrPmW5tb5a4qXiGT57aAQwqT0NMn/Fr2rYeiq3i4RTu07z9i9YKubEG4p0zmxHmD0
 SXQoXzmoBDr+BDXpeJtF5aFTVXgNKm2O6V6xlmV9NAwXuJQAyEIADaYKizKczyEIwY3s
 MkC21eRes0QxO/+r6K5pxs2X/o/qc9D4HWA6JML9cG84jV/oMQZkQm5wACVet0/FhQcc
 qeCnIDTIYXLkEdnzwYGj2RZHNbsXWVEPbLOyi62xW+XgTWHcfJkXiTzC+fH2EMjNWh7+
 OEAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoU7jJBCeACzI5LsRh3fVKrTRSR5V2kyf38YWqIpkqVVZcL8GcNSlFJEQD09+LCWNL/f0HFXx+OZPXXbTtLeT/ziBr+paMlIWxagtFtmW3
X-Gm-Message-State: AOJu0YytscjlMFy3U36XICKcrXxEzPX+CQ4zPCjYIMR229JcUAlOHNzq
 6fr0Cw2ElHTyJrPiEQegn/1GSSFJbL/5j4IGkTaU8JrykcVHZzD+zKPeeLQevYq6MNyd3J7mUfE
 qEQ==
X-Google-Smtp-Source: AGHT+IHxfPuwha5GEENsDS4MPeQlO6mohtEmIvfHwZV/TxlaFpxW7d7iavU9SoluSS9xULfVEP4H6g==
X-Received: by 2002:a05:620a:134c:b0:788:6a76:5f80 with SMTP id
 c12-20020a05620a134c00b007886a765f80mr2469525qkl.56.1710430171045; 
 Thu, 14 Mar 2024 08:29:31 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 pi48-20020a05620a37b000b007882d64d57csm945270qkn.29.2024.03.14.08.29.29
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 08:29:30 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-43095dcbee6so324241cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 14 Mar 2024 08:29:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7nFmsUEg4kcnQ3RNRQDYAPsW46TGaqjJbNavaOTdevNGkBEF795CH9YipMtMTnDldAWrSaYWIDFQxAuU9q9BmPBcchHdQS7FzHrOq+UNv
X-Received: by 2002:ac8:474e:0:b0:430:90af:43c3 with SMTP id
 k14-20020ac8474e000000b0043090af43c3mr272846qtp.21.1710430169466; Thu, 14 Mar
 2024 08:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240307093727.1978126-1-colin.i.king@gmail.com>
In-Reply-To: <20240307093727.1978126-1-colin.i.king@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Mar 2024 08:29:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQ5XBT4Jt6VUgVqxsn7NQZjDCTRFOFk5Fr+Fxkpv55SQ@mail.gmail.com>
Message-ID: <CAD=FV=XQ5XBT4Jt6VUgVqxsn7NQZjDCTRFOFk5Fr+Fxkpv55SQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/msm: remove unused variable 'out'
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Thu, Mar 7, 2024 at 1:37=E2=80=AFAM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> The variable out is being initialized and incremented but it is never
> actually referenced in any other way. The variable is redundant and can
> be removed.
>
> Cleans up clang scan build warning:
> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: warning: variable
> 'out' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ---
>  1 file changed, 3 deletions(-)

Tested-by: Douglas Anderson <dianders@chromium.org>
