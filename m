Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47244AF15B7
	for <lists+freedreno@lfdr.de>; Wed,  2 Jul 2025 14:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FD810E6F4;
	Wed,  2 Jul 2025 12:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e5iucJr3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780D210E2E1
 for <freedreno@lists.freedesktop.org>; Tue,  1 Jul 2025 19:38:48 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-874a68f6516so521306439f.2
 for <freedreno@lists.freedesktop.org>; Tue, 01 Jul 2025 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1751398727; x=1752003527;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JlI2LusSqBKQhKAwOVjtIPc9qQuOGQmC5znI8Uy39jg=;
 b=e5iucJr32QJDIsL1j8vpfVTl7teW2GMvUsPLSTfUhhWjHtfT40Vt70aEqmtMff2xMK
 TukyHtZQ+hfkmZ0HV9ORjmbN8gwUqBLtEjCNYptZY/EwcTw4JhIAzpZbZsZ1VIfvoSzE
 sXLZFXSLhNC5wil4fUSYiAgT/GF3s3xD/oQsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751398727; x=1752003527;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JlI2LusSqBKQhKAwOVjtIPc9qQuOGQmC5znI8Uy39jg=;
 b=FwMNWPCXoF78skbUTaU5MesYOvoAg29Nx4hHcpGtUGxNrZHTOUJ/DCWKUsPG3yfnCz
 JTIridGuvWiLaAWOfkS3M6+LMZxuj9UkEll0VlSJn2HKDzkdvUsggF6x+fEv79mgam8P
 Vz63SveAaSF+c4PRZxhDGZl86vjxuW7C7orzfFNSPicVUVicFGU3wBQGjVnVDDOeRjQX
 uQng4W3wxzb2pWTIa9Lzwd2+Bl/nP5kPHW9cyOJj+O93wqBoy/PyZAh44x8C/f0RJ3Cu
 uPB15nLm5ZWm1YAb7m6RJjdzArY1jFEiyaScabY1QwV5l0FkDEVUSF20kncmvrEABNQZ
 FrDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwnr0ZsJDsROO06foE1Q9omHERxyUGnW5vm8Yf8KfMVgAK2YOpyNxjzpDNo5/5HDJjG11ApmhJWH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEs+IbMkPdKsUVT5P+4drDwJClYNwM+Tp8T/uUIAejlVV+KeuD
 d4t1oYkd9dGuiquxgqO0F8Ui71hclZaMvSYMNyFYqXbB+ni5kiiQ4dJ65RTbF37Z4dk=
X-Gm-Gg: ASbGncuTA9QEWdXLg9b7uVxhL3qskpqVbh+3CBGQrKmYloK9vm5Jw4q7DYT6QMfpS1X
 EuIcYfPmkbhz+QZ/9RmUP834p8ouvw7GbS/2Y2Kd9BjMFYwdtzEC15qPpHmPJ/4XTTigmcrpqxs
 pcH83LNK9rayNNp2x8PHFBwQYUo22GZRryE/266tBBD30cpwUsfbchg/z11L6f3z3+Jo4XjNuXo
 FA469eXXTcau6pTWYGiS09qvwnCOP6I0W6QgPkZ9VV3nD8PCOW0L7QG5QPpu4ZKvguWAIUiMBKT
 +zQpfXV8L9YVjYTDuTKJ7xPd9exUMWTIcfBArbzYrxFdFJlss7kVYMkRL19bEwFNE9LAzBs4usu
 e4G8ZoHTJ
X-Google-Smtp-Source: AGHT+IGvl85HXknFk5WCMqL3KGp3aOWaEvzVt6Rqv1FGK+Z9f2Q+2wtZthqKmGchchXpQiY+DMOzSw==
X-Received: by 2002:a05:6e02:74a:b0:3dd:b5ef:4556 with SMTP id
 e9e14a558f8ab-3e054a307fbmr3075225ab.18.1751398727532; 
 Tue, 01 Jul 2025 12:38:47 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5020486ba41sm2570574173.28.2025.07.01.12.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 12:38:46 -0700 (PDT)
Message-ID: <d040e32a-3519-434f-b6ce-1e63345b23c8@linuxfoundation.org>
Date: Tue, 1 Jul 2025 13:38:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/msm: Remove dead code in msm_ioctl_gem_submit()
To: I Hsin Cheng <richard120310@gmail.com>, robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250623184734.22947-1-richard120310@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250623184734.22947-1-richard120310@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 02 Jul 2025 12:32:36 +0000
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

On 6/23/25 12:47, I Hsin Cheng wrote:
> According to the report of Coverity Scan [1], "sync_file" is going to be
> NULL when entering the "if" section after "out_post_unlock", so
> "fput(sync_file->file)" is never going to be exected in this block.
> 
> [1]: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1655089
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index d4f71bb54e84..cba1dc6fe6c6 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -904,8 +904,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   out_post_unlock:
>   	if (ret && (out_fence_fd >= 0)) {
>   		put_unused_fd(out_fence_fd);
> -		if (sync_file)
> -			fput(sync_file->file);

Are you sure you want delete these two lines? It might not make
sense to check sync_file inside if (ret && (out_fence_fd >= 0)),
but it is ncecessary to fput.

>   	}
>   
>   	if (!IS_ERR_OR_NULL(submit)) {

Check the error paths carefully to see if this is indeed the right fix.

thanks,
-- Shuah
