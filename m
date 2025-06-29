Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6455AECE26
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEC510E0A7;
	Sun, 29 Jun 2025 14:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E/d37Q7J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F13610E35C
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751208856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQhAjIZaqrzSin/ILh/jdA9Kl28mycO6RSVocvPjupU=;
 b=E/d37Q7JhFzLTtHM49KPoqxnmJgy1UmOhMMsajlQS1dgbL2/GVmHuFzA1mD4m6rh8jBeSg
 rSBUy7bmF7zt2dM1/LhAEzPcoW1Hdy9L7On6NoymC6kXd2J8cEjy0eP+yNyq+LKA5498h4
 XnqC0wYXLrXfZqpK6KFiFRdlwaJusjs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322--RLv0i_gPC2w9hLeSnCgGQ-1; Sun, 29 Jun 2025 10:54:14 -0400
X-MC-Unique: -RLv0i_gPC2w9hLeSnCgGQ-1
X-Mimecast-MFC-AGG-ID: -RLv0i_gPC2w9hLeSnCgGQ_1751208854
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a50816ccc6so834903f8f.1
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751208853; x=1751813653;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQhAjIZaqrzSin/ILh/jdA9Kl28mycO6RSVocvPjupU=;
 b=l8wLx4r6GYrLL6G7fgZ7OELbx/MIOFjVg1F273h7eVro5QkbikUIgQe3hrmQEba3kb
 zRSAzzqhVKxOobUDmNPOKZWy5P9IGgyacBV+djzAKI24up0e7uiX930IB4G36tEajsjX
 QYegJ+JKrWasMnHfo3Lhj8hkjCQWaThilAs78EPmJRzVmpZyQgg2vkdt3gHYGsusSQdo
 XN2qVXJdFATN+8Qgu/BdYthSNbWLlb2ek92bmD7kf+JqlawmrrW5S7It1bO0oKNKtXv4
 cQcDye9u8XndJ4EvLhc2bvdcFgw3n5tbSGKa8t/RB9+tLJkKvlMbNAaAV+eY/nEO/pzL
 g9jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0zNuMp0A9n8BWzTVhAmLeUOWv6/gcIiZUwLCxoYuuIIcM5w3RiG8b8ooqm1H0aRjliapDZtjHEVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyucYRjmFvDox/HXSrMXtalU5Uld6i/U0xG3Xbu8b7t4EWfn+8Y
 xhl3fjvhc0dND4eoeBQeYJOy7fy53OUxeLnLNq9oBdbXlzaDXw5fwMmzPENWpiESQUlWAT9yPJh
 SpOdHVwXWmKV7cUZUy2AoTLNa/037jKk3L4Uj76brpBAsx1dWLadzLMTpTICB1HeMI83PEw==
X-Gm-Gg: ASbGncu2o4EzL2Wko4ttCkGnyhchMuGGFURrpoFTQjPkU2g35InZ1KGNph1PRllKIa9
 wSwerCLzaoPOc6O5FXqFCFh7GiCYMl/ed0vrvuKdctGF2BSyhSgrCSNzsqnq1HFTcBe0mezGUeX
 2LgEdL12ka5pHtE2cOcSlvmCHMfaq2087POh+6q/jIs/T6DsA/RqMxVHvlKR9infWnfG0DPVCw1
 ewflZuz8CiRqknRZgVUlY2hfby7xj1uNb+TqX+7m5B5FKH9UMPaYXku8DPRyI5989tlwUI0IqXT
 07+VH8RB7LoppiUIiiJwh/FyvRU3Hzm8mNuZVBOzjc2JQ7RroRnmt83DNDXYZg==
X-Received: by 2002:a05:6000:4186:b0:3a5:57b7:cd7b with SMTP id
 ffacd0b85a97d-3a8f482cf28mr7316066f8f.22.1751208853594; 
 Sun, 29 Jun 2025 07:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBMBWkMBcKHvlqeEC2011OKDiMy1e9qvKMcbYXf7maBrJLSJvn0jG6UetsmvOQwcivB7Qgog==
X-Received: by 2002:a05:6000:4186:b0:3a5:57b7:cd7b with SMTP id
 ffacd0b85a97d-3a8f482cf28mr7316054f8f.22.1751208853166; 
 Sun, 29 Jun 2025 07:54:13 -0700 (PDT)
Received: from ?IPV6:2a00:79c0:638:3500:abf:b8ff:feee:998b?
 ([2a00:79c0:638:3500:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52af3sm8072162f8f.50.2025.06.29.07.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jun 2025 07:54:12 -0700 (PDT)
Message-ID: <20f0c6fa-fb23-4159-b742-58994f2af30d@redhat.com>
Date: Sun, 29 Jun 2025 16:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 42/42] drm/msm: Add VM_BIND throttling
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
 <20250629140537.30850-43-robin.clark@oss.qualcomm.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20250629140537.30850-43-robin.clark@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ie7IQkmARqTl6XJ2sioYMp6y-3ojcbeq3qpCPi7iCok_1751208854
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/29/25 4:03 PM, Rob Clark wrote:

> @@ -1121,6 +1124,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
>   
>   	/* Flush the remaining range: */
>   	prealloc_count(job, first, last);
> +
> +	/*
> +	 * Now that we know the needed amount to pre-alloc, throttle on pending
> +	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
> +	 */
> +	ret = wait_event_interruptible(
> +			to_msm_vm(job->vm)->sched.job_scheduled,

Ick! Please don't peek internal fields of the GPU scheduler (or any other API).
If you solve this within your driver for now, please use your own waitqueue
instead.

However, I think it would be even better to move this to a new generic
drm_throttle component as discussed in previous patches. We can also do this
subsequently though.

> +			atomic_read(&job->queue->in_flight_prealloc) <= 1024);
> +	if (ret)
> +		return ret;
> +
> +	atomic_add(job->prealloc.count, &job->queue->in_flight_prealloc);
> +
> +	return 0;
>   }

