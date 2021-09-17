Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3475C40F2E6
	for <lists+freedreno@lfdr.de>; Fri, 17 Sep 2021 09:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CB76EC07;
	Fri, 17 Sep 2021 07:08:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Fri, 17 Sep 2021 07:08:39 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1790B6EC07
 for <freedreno@lists.freedesktop.org>; Fri, 17 Sep 2021 07:08:38 +0000 (UTC)
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MDhQt-1mZc6G3qpL-00AjJA; Fri, 17 Sep 2021 09:03:31 +0200
Received: by mail-wr1-f51.google.com with SMTP id w17so5294690wrv.10;
 Fri, 17 Sep 2021 00:03:31 -0700 (PDT)
X-Gm-Message-State: AOAM533ae9BrIMk35ZJtVSO9so35w9XhCXOa9cYigdBJp9Mq2XFfLhCD
 JV9SD2L9tFkSiK2RR0bk5T+/YvyW3i0Ju7s9hT8=
X-Google-Smtp-Source: ABdhPJz6K37oowvtVnUkowG0nxZzOI+axmO9A4ikJeOfih5HaJAzy/5L2QcnJCd43z3dvvawjMZrQdmy5VxlRg74EhY=
X-Received: by 2002:a05:6000:1561:: with SMTP id
 1mr863849wrz.369.1631862211495; 
 Fri, 17 Sep 2021 00:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210917005913.157379-1-marex@denx.de>
In-Reply-To: <20210917005913.157379-1-marex@denx.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Sep 2021 09:03:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1wE2r11LE1XX26LAag9xpP1yAeOqArScrK6nP9wK_f8w@mail.gmail.com>
Message-ID: <CAK8P3a1wE2r11LE1XX26LAag9xpP1yAeOqArScrK6nP9wK_f8w@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@chromium.org>, 
 "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:S4YrlN6BgutooWXOx59lR4XG9apJTx3XOggV97tELrfIh1fbJMR
 RDh7/MGD0yY2bTQFi6nrueEtWp3MKs3drk7IhO+mc9jq99pPR1BB8aDk0GVbSjBKQnGvxoc
 Sj+sAz6paJlxJFd+o3kdI4ivTTh6bE/PB6EDE+BUX10Sl3O8U2cPe9HPIqlYO6dRItIiAjU
 8UUPZHRmvHdzchHweD+UQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:smSZZix8oYc=:jCBzE6pFrIHYx4Nv1+Of0T
 Sj+mVDa14iwDu5sPCrPSSWq23LdjWnASDJCpJ/2dIiOTqaLgn9ETN+ssNzlZIEPe99xPUCcJ1
 OReWk/M9ICdLuOn6BkMqv1+9GErojDzy02qwAT+59y1D+ra7xhbKYfSa+anFGEUJQQ4AebR3o
 OwL2PzGnXFTZ5Ori57WlChPYSP+BRsMNjdBqbIEsQhiHfJ4cMqd5mhl0K6N7cjQFgKb/4b1YZ
 KfnOEfyZb6F/b5p47tyKuNoifE4nqsJ7lVNEbgClHJgwKLASf9ntiMjFX/7HoZHStwPPhKqAq
 iNONdvBBS6FNcNzmpcUweyVkUPM/IvcgC/orfVr3tylMiQQQAFr33QUSLNR2DQ0IJ5sqeRSLV
 FAc4NvhnLssdDyrGcnDtaPn3xkvUqZ+Ql38J97t0HBgZXXZfUSSH1xdikD/P4hgrLtePvB7VY
 RfP1vd4uavtHR1P6W1YYTGEJk29MK6SoTdWLmoHQ2rLh3ZxcsaMQTi6UlmHT9Cy0TB81zxwLt
 DIbfIDee5pgthpDmMb2oP138hphx4dCpm5XBEMYgmjuuFrK4u4udkEm0B1e0NZ1qGnKUtUrho
 hLdSEIelKUv5lzouyDgCuMDHdNo14AvsUAK+3UJ3TAPM3LW6hlCySKfuVoewmCFH/hOjiFoYf
 qxzn2TsFYZZc8722XYGHT6WLB5FYjim8CimnsuwMJ2GMywNT+N3cTk7oBUqrNL0gK4GS7GLg8
 AU1JN+5pVNRkNTS3yyQJ9KM/i/i2EJOYnWKdkuZcDsBdiHnqfz5w1qHxBV3wVwie6E9Evb3M0
 bfDyaYxHFSpvkZAQHfsSm9eMK6Sx3Yeu0E75lUqpfgCNClA7t6HeqN6tNjiPXRKMSEsBn2/JS
 jfc7Qdi2uQ1iCrLbl5TA==
Subject: Re: [Freedreno] [PATCH] drm/msm: Avoid potential overflow in
 timeout_to_jiffies()
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

On Fri, Sep 17, 2021 at 2:59 AM Marek Vasut <marex@denx.de> wrote:
>
> The return type of ktime_divns() is s64. The timeout_to_jiffies() currently
> assigns the result of this ktime_divns() to unsigned long, which on 32 bit
> systems may overflow. Furthermore, the result of this function is sometimes
> also passed to functions which expect signed long, dma_fence_wait_timeout()
> is one such example.
>
> Fix this by adjusting the type of remaining_jiffies to s64, so we do not
> suffer overflow there, and return a value limited to range of 0..INT_MAX,
> which is safe for all usecases of this timeout.
>
> The above overflow can be triggered if userspace passes in too large timeout
> value, larger than INT_MAX / HZ seconds. The kernel detects it and complains
> about "schedule_timeout: wrong timeout value %lx" and generates a warning
> backtrace.
>
> Note that this fixes commit 6cedb8b377bb ("drm/msm: avoid using 'timespec'"),
> because the previously used timespec_to_jiffies() function returned unsigned
> long instead of s64:
> static inline unsigned long timespec_to_jiffies(const struct timespec *value)
>
> Fixes: 6cedb8b377bb ("drm/msm: avoid using 'timespec'")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: stable@vger.kernel.org # 5.6+
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>
