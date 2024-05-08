Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BA78C0778
	for <lists+freedreno@lfdr.de>; Thu,  9 May 2024 00:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211DC10E336;
	Wed,  8 May 2024 22:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WOBl+Rt5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD27310E336
 for <freedreno@lists.freedesktop.org>; Wed,  8 May 2024 22:47:50 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a59ae3efbb3so24165866b.1
 for <freedreno@lists.freedesktop.org>; Wed, 08 May 2024 15:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715208469; x=1715813269;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EwxEO1i5UPI2XEISzMMX9ftGaU8p/mPogEOhXcQuJ0Q=;
 b=WOBl+Rt5PIlBoie3QnoQoijX1fkmzWkvZbrqFXljeY+RLMqvYOSyB82Odv5EPRjIUM
 rZfLzomprNY5RJGtrBfnxUz4PcyzNGtQDsazJL+Jg/jKYOcxYHcYNWG/1X+N7U8hZMdv
 wzR1xxb97stts5xdjwjvca1byiBpt3AfvQfw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715208469; x=1715813269;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EwxEO1i5UPI2XEISzMMX9ftGaU8p/mPogEOhXcQuJ0Q=;
 b=wwm8uaFYqbPphrHJ1WwlnPkKm6nzHWxscd7UbStbEGiHVNPEsRkOT97Hmk3jLydE4t
 4KgY6HZUFtv+0DFMgaM8zFjHMMYCZlK3j9AndKsE8HGLeeLO0FFiblBjbtBR1DqZQt8h
 8wCA3CkgTQvoQ/1U+U2Vkph3eQElNJ4tE+XjEUkFNK07lRoLy4jscDO+mgIyW/SDctf5
 NthHpQQWiNzrcy609H1I+qeU44x8jwRCAP1Cz8qnLese9gt8v8RxMjnFJmgO1CF7E1ZW
 efuMtwN7j1laIOYJWdnrhF3YHc9oMX4+v1Alp8sS9dA31+8x88yVmQPg4bk8wxU52Wi7
 d3WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKDFklsKJt0jazsCGFitKJzmaJ8SaiCyRkgbujOoIyRwf9GMw85zMQ2LEaTOjWij3apq8KeCbzjWalvRldMlrSimpO4eQiKlqVssuljGkK
X-Gm-Message-State: AOJu0Yxwz4rooiJVLsVUFPnXjATontUAA6dmMzOiNqzF54sg5kuUIFZL
 KPUcHUipc51fG9AnM6EzTMj5RHDVO0dzf91lZ8DQavIANrRMZ6BeB2KCBW3R+I8EIqUCo+CL6g6
 DcC7Y
X-Google-Smtp-Source: AGHT+IF9PVXUKy8QJ6KEa7ywlVUtRGa3lIrM/LtYFwlCYdK0g8UA86FUzdSFAPyLjAt+Ht/4qaNm+w==
X-Received: by 2002:a50:9f8d:0:b0:56d:f3f3:f61f with SMTP id
 4fb4d7f45d1cf-5731d9a284dmr3047483a12.9.1715208468885; 
 Wed, 08 May 2024 15:47:48 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c322c11sm54158a12.82.2024.05.08.15.47.47
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 15:47:48 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5724736770cso1964a12.1
 for <freedreno@lists.freedesktop.org>; Wed, 08 May 2024 15:47:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtoN7mWbkLFjuogpoEfDo2h1gmR1OzEZctmuDhkY2FuY1fhCPkjQOGHAARwub5NVFDIL6XO34V0Y6In/OPRlF3RpM0zv6s8XDug7X92te8
X-Received: by 2002:a05:600c:b5a:b0:41b:e416:1073 with SMTP id
 5b1f17b1804b1-41fc27b0e81mr775855e9.0.1715208085721; Wed, 08 May 2024
 15:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-1-f80a60ce21a1@linaro.org>
In-Reply-To: <20240503-fd-fix-lxml-v2-1-f80a60ce21a1@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 May 2024 15:41:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XnpS-=CookKxzFM8og9WCSEMxfESmfTYH811438qg4ng@mail.gmail.com>
Message-ID: <CAD=FV=XnpS-=CookKxzFM8og9WCSEMxfESmfTYH811438qg4ng@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/gen_header: allow skipping the validation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
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

On Fri, May 3, 2024 at 11:15=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> @@ -941,6 +948,7 @@ def main():
>         parser =3D argparse.ArgumentParser()
>         parser.add_argument('--rnn', type=3Dstr, required=3DTrue)
>         parser.add_argument('--xml', type=3Dstr, required=3DTrue)
> +       parser.add_argument('--validate', action=3Dargparse.BooleanOption=
alAction)

FWIW, the above (argparse.BooleanOptionalAction) appears to be a
python 3.9 thing. My own build environment happens to have python3
default to python 3.8 and thus I get a build error related to this. I
have no idea what the kernel usually assumes for a baseline, but
others might get build errors too. I don't even see python listed in:

https://docs.kernel.org/process/changes.html

...in any case, if it's easy to change this to not require python3.9
that would at least help for my build environment. :-P

-Doug
